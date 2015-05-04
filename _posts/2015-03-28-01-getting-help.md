---
layout:     post
title:      "1.2 Getting help online"
subtitle:   "What to do when you are stuck: there is an art to asking for help, and getting it."
date:       2015-03-28 12:00:00
author:     "Dcycle"
header-img: "img/post-bg-01.jpg"
class:      "1"
order:      100
parent:     "<a href=\"/class-01-basics\">Class 1: Basics</a>"
---

You will run into trouble; it's normal
-----

Most beginner to intermediate developers somehow think they're to blame when they run into trouble. They're not: the software is hard to understand, complex, and has bugs; and the documentation is always out of date. In this lesson we'll see how to make sense of it all by leveraging online resources.

Step 1: do an online search
-----

Many new developers don't have this reflex: when something goes wrong, you should start with an online search. Many seasoned developers who come from non-open source systems don't have this reflex either. Recall in lesson 1.1. that we are exclusively going to use open source software during this course. In addition to being free, its main advantage is that its users and developers tend to share not only their code but their discussions and their bug reports. All of this is freely available and you must get used to finding it.

Those of you who have had problems in lesson 1.1. have learned how to get support directly on the issue queue of this course.

One such issue has been "[What to do if changes to Jekyll site are not reflected on hosted site?](https://github.com/dcycleproject/dcycleu/issues/2)": a student has run into a problem where his Jekyll site was not updated as expected (I subsequently added information on the site to explain that you need to verify your email for your site to be updated). In this issue, I found the answer online by doing a search for "github site not updating", and the first result was [Github pages are not updating, on StackOverflow](http://stackoverflow.com/questions/20422279/github-pages-are-not-updating), which provided the answer to the student's question.

Starting now, _before submitting a support request to our issue queue_, do your best and try and find the answer to your question yourself, online. If you are getting unexpected behaviour with software or a website such as GitHub, your search terms should be as short and general as possible while remaining accurate:

 * The search "Github site not updating" will give you results.
 * The search "Github site not working" is too vague because GitHub does a lot more than update site. "not working" can refer to anything.
 * The search "My site is not updating" is too vague; you must specify that you are on GitHub.
 * The search "My Github site 'Flower blog guy' not updating" is too specific: don't include any information specific to your use of the software.

Almost all of the time, someone will have encountered the same problem before you, and you will find the answer to your question. Once you do, feel free to submit an improvement request to DcycleU's issue queue, suggesting that the fruit of your research be added to the lesson for the benefit of other students.

In most cases, starting now, your support requests for this course should include either a link to whatever resource you found online or a description of what you searched for, what you expected to find, what you found and what you did not find.

Step 2: How to ask for help, and how not to ask for help
-----

A good place to start asking questions and getting help is [StackOverflow](http://stackoverflow.com): a community of development experts assking and answering questions categorized by tag.

Create an account with the same username as you used for GitHub in the first lesson, and start by looking at existing questions to get a feel for how to ask for help.

Later on in this course, we will start working with Drupal and get to know [Drupal.org](https://www.drupal.org), another great resource. For now take a look at these examples of _how not to ask for help_:

 * [Taxonomy problem, please help!](https://www.drupal.org/node/2422107)
 * [guys please help me](https://www.drupal.org/node/2354113)
 * [doesn't work](https://www.drupal.org/node/2431387)

Developers and users of open source software work for free, and they are under no obligation to help you. Why do we do it, then? Because we enjoy helping people, but most of all because we _love to create great software_.

A develop who gets a request like one of the three above examples is most likely to ignore it, because developers don't care if you need help. They also don't care if you're frustrated or on a deadline: all they care about is making their software better. Better titles for the above support requests would have been:

 * How to redirect from a taxonomy page to the home page?
 * How to create a stream of Facebook and Twitter activity using Drupal Wall?
 * animate.css is not being added to page source

When you are asking for help, whatever the forum, do provide:

 * The shortest and most general useful description of your problem _in the title_. The issue title is key; spend time making it good.
 * A step-by-step account of what you did.
 * What you are expecting to happen.
 * What happened instead.
 * A short description of what you found during your online search on the topic.
 * If you're getting an error message, copy-paste it into your support request or bug report.

Things to avoid when asking for help:

 * Don't say how frustrated you are (no one cares).
 * Don't say you are on a deadline (no one cares).
 * Certain issue queues (Drupal's, for example), allow you to specify a "priority" (normal, urgent, minor). This is not meant to reflect how urgent the problem is for you, but for the project. The project maintainer will set this accordingly.
 * Don't say "Please help". It is useless and sounds desperate. No one wants to help someone who says "Please help", the same way no one wants to be friends with the kid who says "Please be my friend".
 * DON'T SHOUT and don't use exclamation points!!!
 * Don't give passwords or other sensitive information.

A word about emails and ticketing systems
-----

As a general rule, make sure any support request or bug report you have, for any site or software, is available on a public URL. Then, if you must, you can reference that in emails or with ticketing systems (a ticketing system is generally a form you fill out on a website). Two reasons:

 * Emails and ticketing systems leave no public trace. Months from now, you are guaranteed to have the exact same problem you're having now; when you do, you will want to find your original bug report or support request by doing a simple web search.
 * Other people are guaranteed to have the same problem you're having. When they do, you want them to do a web search, find your public support request or bug report to report their own findings, helping to move the issue forward.

The word "canonical" means a single source of the truth. You want your canonical bug report or support request to be on an issue queue or forum thread _with a public URL_; not on an email.

Before moving on:
-----

Before going on to the next lesson, make sure:

 * you have a StackOverflow account with the username you'll use as your online identity.
 * you have looked at at least ten questions on StackOverflow.
 * you feel confortable with what to do and what not to do when asking for help.
