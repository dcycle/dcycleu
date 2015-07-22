---
layout:     post
title:      "2.2 Psychology of continuous integration"
subtitle:   "Continuous integration (CI) is fragile, and is only useful if used right."
date:       2015-05-22 12:00:00
author:     "Dcycle"
header-img: "img/post-bg-01.jpg"
class:      "2c"
parent:     "<a href=\"/class-02-continuous-integration\">Class 2: Continuous integration</a>"
---

CircleCI, and other continuous integration tools like Travis and Jenkins, which you may come across during your career, and just that: tools. Like all tools, they are only as useful as the processes that surround them. Several teams have tried to implement continuous integration as a practice; and failed because they did not adapt their processes.

Continuous integration is necessary and good, but it's not a magic bullet. In this lesson we will see why and how to implement continuous integration from a psychological standpoint.

Continuous integration limits technical debt
-----

Continuous integration (CI) adds a layer of complexity to your workflow, and it only works if you are convinced of its value. It is common for organizations to try continuous integration tools, find them too cumbersome, and abandon them.

The basic value proposition of continuous integration is that it limits technical debt, and its cost is offset, but later on in the lifecycle of your project.

So what is technical debt?

Think of actual monetary debt: borrowing money to buy something now, and paying back that money sometime in the future.

When writing code, there are a number of best practices such as commenting your code, making sure it "works" (can be deployed), and then there is the fancy stuff such as testing (which we'll get into later) and decoupling (which we won't).

These all take time, and if you are in a rush to code some feature, you can avoid all or some of these best practices. This is known as technical debt because you are essentially borrowing against the future:

 * If you don't comment your code, you'll work faster, but some poor sucker (probably you) will spend hours, instead of minutes, figuring what out what the code is actually accomplishing.
 * If you don't write automated tests, a fix to something seemingly unrelated will break a feature, probably just before a long weekend.

Like monetary debt, technical debt is sometimes useful: if you're launching your site the next day, less comments and a faster deployment might be a good tradeoff. But like monetary debt, technical debt is not something you should ignore.

Continuous integration limits technical debt because it provides a quality threshold under which your project is failing, so it's harder for you to lower the quality of your code too much for the sake of faster development.

Right now, our quality threshold for a project to fail is really very low: if it's impossible to compile a site, the project should be in a failing state. That's pretty obvious. However, once you have your CI server in place (as you do), over time you might want to increase your quality threshold. For example, your build might fail if:

 * automated tests are failing.
 * you don't have at least a certain percentage of comments in your code.
 * your CSS or HTML doesn't pass some industry-standard validation.
 * your test coverage (the percentage of code which actually runs during automated tests) is too low.

Once your team has accepted these thresholds, everyone will want to avoid being the person who "broke" the project, quality will remain higher, and technical debut will accrue at a lower pace.

Double your estimates
-----

So if you're borrowing less from the future to deploy code faster today, that effort has to come from somewhere: whatever you do will take longer because it will be of a higher quality. Furthermore, there is an effort in maintaining your CI server and scripts.

All of this adds up (roughly) to doubling your estimates. Of course, this will pay you dividends in the future in the form of fewer bugs, less crises, and higher quality overall. Practitioners of CI think the trade-off is worth it in the long-term.

But CI is not a magic bullet, and you must decide if it is right for you. If you think it's not, you might want to reconsider taking this course!

Involve stakeholders
-----

Several attempts to implement CI in a workplace fail, in fact most do, and the reason has to do with people, not the technology.

Stakeholders of your site include developers, managers, the client, and anyone who has any stake in the site at all.

If you are in the only person in the team who is all excited about CI, it won't work because your teammates will ignore the new technology, and often actively sabotage it. As soon as something goes wrong, or the level of stress increases for a project, the value of CI will be put into question.

In fact, this does not just apply to CI, but essentially to every aspect of this course, from DevOps to CI to automated testing to Agile. Mention any of these things to teams which are not doing them, and the response will be the same: great, but what is the business value of this? What can we show for it.

The answer, alas!, is "nothing": no crises, no bugs, no regressions, no technical debt. Well, less of these actually.

"Nothing" is hard to sell:

<iframe width="560" height="315" src="https://www.youtube.com/embed/ofOSlsNz5I8?list=RDofOSlsNz5I8" frameborder="0" allowfullscreen></iframe>

When are development teams in the market for "nothing"? Well, you need to wait for teams to realize that their current approach is not working, for them to actively seek out a solution, and to come to the conclusion that they need CI (and the other practices outlined in this course), _and that they are willing to pay for it by doubling their budgets_. That's when you come in as the expert.

To avoid frustration, don't try to sell this stuff to teams who are not ready for it.

Selling quality to clients is easier: do not give them the choice. If you are responding to an RFP, seek out those which require best practices if possible, and never itemize CI or any other best practice on your response. In the same way, electricians won't bill you having the right tools, a window cleaner won't bill you for a safety harness. These are just part of the job.

Visibility and transparency
-----

Once your team has agreed on CI, you need to make it visible to everyone. If you're in an actual office, a wall-mounted screen is a good way to see the status of your jobs:

<img src="/img/2015-05-22-02-wall.png" />

The above was achieved with a low-cost tiny computer called a Raspberry PI, wired up to a screen we had lying around, and cost less than 100$USD. More ambitious teams will try wiring up their computers to traffic lights or a lighting system making the room red when a build is failing.

If you are working remotely, it is a good idea to touch base daily or a few times a week via video chat; you should make a habit of checking the status of your projects at those times.

One advantage of monitoring your builds is that they become important. Everyone will know if something is broken, and it will become a priority to fix it. Your team's general goal will go from the very ambiguous "make stuff work" to "make sure the builds are passing", which leaves less room for interpretation.

Another advantage has to do with communication with non-technical people. Managers and clients are generally nervous when dealing with developers: they have no idea how things are progressing, apart from the occasional "We're almost done".

Having a visible CI dashboard can provide non-technical stakeholders with data they can understand: whether a project is passing or failing (and if it's failing, who broke it), when it was last tested (yesterday, or a month ago). Eventually, you could wire up your CI dashboard to provide trends and other metrics which everyone understands: over time, do we have more or less test coverage, more or less code complexity, more or less comments, more or less adherence to coding standards.

Your CI server will grow with time to contain all the information that is important to your team.

Never subvert the process
-----

Eventually, you will come to a point where your CI process itself will seem like an impediment. Consider the following (fictional) example: it's 3:30 pm on a Friday, and a crucial security flaw is found on your production site.

Your team is faced with a choice: log onto the production site and "fix" it with a one-line change to your code, or go through your entire process, wait for your job to pass on your CI server. The latter might take longer, it might even take hours where a hack might take minutes.

This is where teams are often in a crunch and have to make a decision. Do you, "just this once", "fix" the problem on the production server, or do you go through the process? Although there might be extreme examples where a hack to the production server is the better choice, that is a case of subverting the process: your version control system contains no trace of the change, your Docker container becomes somehow special because you made a change to it, and your CI dashboard no longer reflects reality.

It is obvious that all of this is technical debt, and should probably be avoided. Many teams who are invested in CI keep their production servers under lock down: it is literally impossible to log in a change them, as everything must be done through the CI process.

Conclusion
-----

In this class we have seen that continuous integration (CI) by itself is only as useful as a team's dedication to use it. It is not a magic bullet, and it's expensive. But less expensive than incurring technical debt.
