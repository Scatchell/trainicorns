---
layout: default
title: Lecture 1 - Introduction
type: lecture
objectives:
    - Understand that this boot camp is taught using the Socratic method and
      focuses on hands-on labs.
    - Discuss the class contract and commit to following it throughout.
    - Become familiar with pair programming.
    - Become familiar with TDD.
    - Become familiar with version control.
    - Understand the single responsibility principle.
    - Understand the value of DRY (don't repeat yourself).
labs:
    - lab-1-rectangle
---

A good way to start is by reading and understanding the following supplementary content, and then going through the [these slides](/trainicorns/assets/files/oo_principles_w_bootcamp_slides.pptx) (notes included) if you wish.

Bootcamp exercise materials and programming problems/solutions can be found [here, on wazokazi](https://confluence.wazokazi.com//display/Training/Object+Boot+Camp), at least until we manage to port all of it to this (much better) site.

## Welcome

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

Point out that nothing we teach in bootcamp is **law**. Every rule can be
broken and students should feel free to challenge instructors.

## Introductions

Have each person introduce themselves:

   * Name
   * Background, programming experience
   * Icebreaker (something you can do with a shoe that isn't wearing it, what
       would you do if you could fly, etc)
   * Fears, hopes & questions


## Contract

* No playing on phones & laptops
  * Keeping laptops closed during presentations is a big problem...be strict about it
* Silence mobile phones
* No side discussions
* Show up on time (if you don't, you owe everyone coffee)


## Shape of the Class

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

## Outline of the Class

* Agile practices (TDD and pair programming)
* Encapsulation
* Immutability
* Object relationships (delegation, collaboration and inheritance)
* Polymorphism
* Interfaces, abstract classes and concrete classes
* Refactoring
* Recursion

## Test Driven Development

Explain that the class will be taught strictly using TDD throughout. Open the
discussion by asking what TDD is? How does it affect the code you write?

It might be worth touching on "what a unit test" is at this point, depending on
the knowledge level of the class.

The laws of TDD:

* You are not allowed to write any production code unless it is to make a
    failing unit test pass.
* You are not allowed to write any more of a unit test than is sufficient to
    fail; and compilation errors are failures.
* You are not allowed to write any more production code than is sufficient to
    pass the one failing unit test.

Explain that TDD is a series of very small iterative steps. This comes with
several important positives. Remember, **developers should be lazy**. Only do
the minimum necessary to make a test pass (and thus the code "work").

* All code is testable -- by definition.
* All modules are forced to be decoupled.
* This drives your design in a positive direction.

Explain the cycle:

* Red
* Green
* Refactor

Ask the students what color the bar should be when starting each phase:

* Write a failing test (*green*)
* Write the code to make the test pass (*red*)
* Refactor (*green*)

## Pairing

Start by asking what they think it means, then move on to a discussion about
common misconceptions.

* Takes longer
* Expensive
* Hygiene
* Slowing down more experienced people

Address these and other concerns that they might have and explain the benefits.

* Strategic vs. tactical thinking
* Mentoring & upskilling
* Reduce knowledge silos and bus factors
* Produce better (less bugs) code
* Fun!

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

## Introduction to Objects

**Single Responsibility Principle**

A class should only have one reason to change.

As an example, consider a class that both compiles and prints a report. Such a
class can be changed for two reasons.

1. The content of the report can change.
2. The format of the report can change.

These two things change for very different reasons; one changes data, and one
changes the way it's presented.

The single responsibility principle says that these two aspects of the problem
are actually separate, and therefore should be in separate classes. It would be
a bad design to couple two things that change for different reasons at
different times.

Ask why we care about single responsbility?

* Makes the class more robust *(e.g. if there's a change in compilation it's
    likely to break presentation when both responsibilities are coupled)*
* Manages complexity by making many small, simple pieces

**Don't Repeat Yourself**

Often abbreviated to *DRY*. Find and eliminate duplication whenever you can.

Ask why we want to reduce duplication?

* Only having to change things in one place reduces likelihood of errors.
* A modification of any single element of a system does not require a change in
    other logically unrelated elements.
* Related elements change predictably.
* Why type more or do more work than you have to?

DRY applies to more than just code: database schema design, object modeling,
tests, documentation, just about everything!

