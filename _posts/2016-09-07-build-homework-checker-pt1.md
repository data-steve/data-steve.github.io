---
layout: post
title: 'HW Checker: R, AppScripts, & Google Forms'
tags: [R, googleformr, appscripts]
---

![](/images/appscripts_r.png)

<a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega">googleformr</a>

For the past few months I've been toying with the idea of using googleformr to empower data science-oriented instructors to use data science in their workflow. In this 2-part series of posts, I'll show how to AppScripts and R to turn Google Forms into a homework checker. 

I was encouraged along this path by <a href='https://twitter.com/mhawksey' target='_blank'>Martin Hawksey's</a> post  <a href='https://mashe.hawksey.info/2012/01/tags-r/' target='_blank'>on AppScripts and R</a> as well as by his direct help in considering some email triggering options with AppScripts.



<div style="float:right; margin:15px;">
	<img src="/images/hwchecker_form.png" width="300">
</div>


## Toy example

The most basic example I thought worth sharing was an app that had the following: 

- some security (in the form of a password),
- an email to direct feedback to and to confirm student identity, and 
- a place to push homework submissions to.

With these 3 inputs you can pretty much insure that only your students can use this form, so that keeps out spam and the such.

#### Password

Google Forms provides some rather nifty data validation tools that are specific to each data type. I used short answer for my password data type, and I leverage the data validation as password validation. In the toy example below, I just used `aaa` as the required password. You can add these elements to a form item by clicking on the triple dot settings option at bottom right of item space.

![](/images/hwchecker_pwd_regex.png)

While this password validation will work if you are directly inputing answers by hand into the web form directly, it won't work with googleformr because googleformr bypasses the form elements and posts directly to the input node in the form. Still it is going to be helpful in keeping out people who aren't your students, austensibly the only ones with the password. But to be extra careful, you may want to create your own homework function that has password validation directly, as seen below.

    homework_submit <- function(pwd=NULL, email=NULL, answer){
      try(if(is.null(pwd)) stop("Please enter a password."))
      if(pwd!="aaa") stop("That is not the correct password.")
      ....
    }

I don't wrap the password test in `try` because when it errors it gives the password condition in the error message.

#### Email

I suppose I could have done some fancy email validation in Google Forms, but if I really wanted that, I'd just create a function for submitting homework that gave me more control over email validation at the source. If you'd like to do that, the email validator would look like so:

    is_email <- function(x) {
      grepl("([_+a-z0-9-]+(\\.[_+a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,14}))"
        , x, ignore.case = TRUE)
    }

You could also make it have special school email flavors by changing the `school` suboption to whatever your school email is after `@` sign.

    is_school_email <- function(x, school=NULL) {
      if (is.null(school)){
        is_email(x)
      } else {
        grepl(paste0("([_+a-z0-9-]+(\\.[_+a-z0-9-]+)*@",school,")")
                , x, ignore.case = TRUE)
      }
    }

So the end product could look like this:

    homework_submit <- function(pwd=NULL, email=NULL, answer){
      try(if(is.null(pwd)) stop("Please use class password."))
      if(pwd!="aaa") stop("That is not the correct password.")
      try(if(!is_email(email)) stop("Please use real email address."))
      ....
    }
    
But the other reason I don't do this is that I want students to give me a specific email that I can associate with their identity for recordkeeping and grading. This would need to be collected independently from this form. 

In the back end of Google Forms, I have an AppScript that handles email identity checking. If the email is one that my student has registered with me, then it proceeds with checking the value of #1 against my tests. If it isn't, it automatically emails the student, informing her that she'll need to resubmit the homework and reminding them to use the email address they've registered with me.

After you've created your form to collect the homework answers you want from your students, you can use **googleformr** to build your function to allow students to programmatically submit their answers directly to your google form. This code chunk below serves as a template. 

    library(googleformr)
    url <- "your_google_form_url"
    
Using the `get_form_str` function you can confirm that the structure of the form is the structure of the input entry nodes you get back from googleformr.

    get_form_str(url)
    
        	Order your post content
    	according to the Questions on Form
         entry.qs  entry.ids         
    [1,] "pwd *"   "entry.1089329191"
    [2,] "Email *" "entry.2028747629"
    [3,] "#1 *"    "entry.1639114256"


Once you are satisfied, you can create the function hwchecker with `googleformr::gformr` handling all the linking and function construction. The resulting function will expect a vector of inputs in the same order as `get_form_str` displayed.

    hwchecker <- gformr(url, custom_reply="HW being checked!")
    hwchecker(c("aaa","not a real email@some_email_provider.com","yes")) 
    
My last post explored the details of posting multiple answers to a <a href='/post-multiple-answers-to-google-forms' target='_blank'>google form with googleformr</a>. The main thing I re-emphasize here is that functions created with gformr expect a vector of answers as long as and in the same order as the form entries.


#### Answer #1

In this one example, I've simply put `yes` as an answer, the correct answer in this case. However, I've shown in <a href='/post-multiple-answers-to-google-forms' target='_blank'>my previous post on googleformr</a> that you can put almost anything into a  form item of the data type short answer, including a dataframe. And the chosen form of feedback I offer in this toy example is that if the student posts an answer other than `yes`, namely `no`, then they're told their answer is `too low` in the spirit of `TRUE=1` and `FALSE=0`. 

The possibility of feedback is as flexible as the person developing the app is at writing tests. Even though AppScripts is an extension of JavaScript, the loop and conditional logic structures they use are quite familiar to R developers with any experience.

#### Make your hwsubmit function

So now, your custom `hwsubmit` function has password protection, email validation, and a direct link to your google form. We can even throw in a verification that they didn't forget to include their answers. 

Now to create `hwsubmit`, simply create all the prereqs above and then change the `NULL` values on the suboptions `pswd` and `school` in the function below to set the password and school-email specific parameters for your needs. It will return a function that has all the parameters set.

    hwsubmit <- function(pswd = NULL,school=NULL){
      try(if(is.null) stop("Assign the school email suffix."))
      
      function(pwd=NULL, email=NULL , answer=NULL, school=NULL){
        # error handling
        try(if(is.null(pwd)) stop("Please use class password."))
        if(pwd!=pswd) stop("That is not the correct password.") 
        if(!is_school_email(email,school)) stop("Please use school email."))
        try(if(is.null(answer)) stop("Don't forget to include your answers."))
        
        if (!is.null(pwd) & pwd==pswd & 
            is_school_email(email,school) & !is.null(answer)){
          hwchecker(c(pwd, email,answer))
        } else {
          message("Check your inputs to homework_submit")
        }
      }
    }

When this function is saved into a package and distributed to your students, they will be able to submit their homework as easily as

    hwsubmit(pwd    = "aaa"
           , email  = "not a real email@some_email_provider.com"
           , answer = "yes")

Notice that with `hwsubmit`, each part has its own parameter for checking, and then is concantenated into a vector inside `hwchecker`. Of course, if you have multiple answers to submit, you will need to put them in order and wrap them up in `c()` as a vector.

## Wrap Up and Pt.2

In the next post, I'll detail some of the AppScript choices that I made, which are easily extensible. I personally found using AppScripts to be an interesting opportunity to do some practical javascript work without having to build all the website stuff.

Some of the options related to setting event triggers do take some thought, but there are good examples to follow -- hopefully, mine included.

Using AppScripts, the possibilities of how to use Google Apps to do some many tasks is quite impressive. All the more so because it is free.


<a href="https://twitter.com/share" class="twitter-share-button" data-via="data_steve" data-size="large" data-hashtags="rstats,appscripts,GAS" data-dnt="true">Tweet</a><a class="github-button" href="https://github.com/data-steve/googleformr" data-icon="octicon-star" data-style="mega">googleformr</a>