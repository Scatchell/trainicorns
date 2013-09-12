---
layout: default
objectives:
    - Understand that this boot camp is taught using the Socratic method and
      focuses on hands-on labs.
    - Discuss the class contract and commit to following it throughout.
    - Understand basic OO terminology and coding standards.
    - Be able to define the job of a class.
    - Understand encapsulation.
labs:
    - lab-1-rectangle

---

Welcome
-------

Welcome to the first day of bootcamp!

Over the course of the next several weeks, we'll discuss and code a number of
different object-oriented programming principles and practices, agile
development techniques and general consulting skills.

Our goal is to work together to make ourselves better programmers who build
systems that are simple, maintainable and defect-free.

This bootcamp teaches specific ways to think about objects and programming
that may be very different that what you are used to. Through the numerous labs
and discussions we hope that you will see value of this perspective and the
value of the practices we introduce.

Introductions
-------------

Have each person introduce themselves:

   * Name
   * Background, programming experience
   * Icebreaker (something you can do with a shoe that isn't wearing it, what
       would you do if you could fly, etc)
   * Fears, hopes & questions


Contract
--------

* No playing on phones & laptops
* Silence mobile phones
* No side discussions
* Show up on time (if you don't, you owe everyone coffee)


Shape of the Class
------------------

The class is taught using the Socratic method. The expectation is that students
will work to teach themselves.

The instructor(s) will lay out problems for students to solve and then ask
questions about the solutions to help direct them. **Do not lead by the hand to
the right answer**.

Students will struggle at times, but struggle is good.

> "Good judgement comes from experience, and experience comes from bad
> judgement." - Fred Brooks

The general structure is about 75% of the class will be hands on programming
labs.  The remaining time will be discussion-based learning, reviewing
solutions to the labs.

Discussions take the form of putting students' code on a projector and having
an open dialogue about the design and the implementation details.

This may be frightening at first, but after a couple days people start begging
to have their code shown.

__Be cautious of giving out too much information as it could impede the
Socratic Method.__

Outline of the Class
--------------------

* Agile practices (TDD and pair programming)
* Encapsulation
* Immutability
* Object relationships (delegation, collaboration and inheritance)
* Polymorphism
* Interfaces, abstract classes and concrete classes
* Refactoring
* Recursion

Test Driven Development
-----------------------

Explain that the class will be taught strictly using TDD throughout. Open the
discussion by asking what TDD is? How does it affect the code you write?

Explain the cycle:

* Red
* Green
* Refactor

Ask the students what color the bar should be when starting each phase: 
* Write a failing test (*green*)
* Write the code to make the test pass (*red*)
* Refactor (*green*)

Ask the students to define refactoring: The process of changing a software
system in such a way that it does not alter the external behavior of the code
yet improves its internal structure. 

Ask why we refactor: 

* Remove duplication 
* More clearly express intent 
* Make more maintainable 
* Broken windows. If the students are unfamiliar with the theory of broken
    windows, introduce it. 

Pairing Conversation 
--------------------

Open with a discussion on pairing. Start by asking what they think it means,
then move on to a discussion about common misconceptions.

* Takes longer
* Expensive
* Hygiene
* Slowing down more experienced people

Address these and other concerns that they might have and explain the benefits.

Discuss how we have to agree that when pairing, we're in a safe environment.

* No telling your pair they're an idiot, or insulting them.
* Pay attention, even when not driving.
* Communication and discussion is the most important thing while pairing.
    Neither driver nor navigator should be silent.

Discuss some pairing styles: 

* Least experienced person drives 
* Ping pong: one person writes a failing test, other fixes it by writing code
    and writes the next test, repeat 
* Ball and board: one person runs mouse the other runs the keyboard.
* Two different keyboards, mice, and monitors.
* Switch frequently.
