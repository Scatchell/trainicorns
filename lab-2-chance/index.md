---
layout: default
objectives:
    - Start learning to use the IDE
    - Understand the value of custom classes over primitives
    - Be able to apply YAGNI
    - Be able to apply DRY

---

Part 1 - What's Not to Like
===========================

*(1 hour, 15 mins design, 30 mins code, 15 mins discussion)*

Ask the student to model the chance of something happening. For example, when
flipping a coin, what is the likelihood of 'heads'? When rolling a die what is
the likelihood of a '2'?

Discuss as a class how we might design an object that models this. We'll call
our class `Chance`.

* What properties might `Chance` have?
    * Represent mathematical probability (either rational or real, i.e. 1/2 or
        0.5)
* What about the probability of the complement (not)?
* The probability of both occuring (and)?
* The probability of any one occuring (or)?

For the first part have the class just implement `Chance` and a `not()` method.
Remind them that throughout the course tests must be written first.

After the hour, ask for volunteers (or if no one volunteers, select a pair) to
present their solution in front of the class. Discuss as a class the positives
and negatives of their solution, then repeat until there are either no more
unique solutions or everyone has shown their solution.

Common mistakes to be aware of:

* Returning a `double` from `not()` - Aside from breaking encapsulation, it also
    doesn't belong to the problem domain.
* A method that returns a `double` value of the `Chance` - Breaks encapsulation.
* Testing the constructor.
* Unclear variable or method names.
* Calling parameter in `equals()` something like `probability` or `chance`.
    A more description names, like `other` makes more sense.

What tests did the students write first? How did this drive their design? (e.g.
to test `not()` students have to have an `equals()` method - ergo the
`equals()` method is the first thing that students should have tested)


Part 2 - And, But
=================

After discussing the previous section about `not()`, ask students to implement
two more methods: `and()` and `or()`

    P(A && B) := P(A) * P(B)
    P(A || B) := P(A) + P(B) - P(A) * P(B)

