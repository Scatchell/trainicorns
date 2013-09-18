---
layout: default
title: Lab 1 - Rectangle
objectives:
    - Understand basic OO terminology and coding standards.
    - Be able to define the job of a class.
    - Understand encapsulation.

---

## Part 1 - It's Dangerous to Go Alone

*(30 mins)*

Ask the students to model a geometric rectangle. The idea is to allow them to
make the mistake of implementing getter's and setter's for things like height
and width.

After time has run out, review the solutions and discuss them. If there are
getter's and setter's, explain how exposing data breaks encapsulation and that
we only want to expose behavior.

Things to look out for:

* Names of variables, methods, parameters - e.g. `calculateArea()`,
    `computePerimeter()`, etc.
* Unnecessary stuff - diagonal, etc.
* Duplication - especially in the tests eg: new Rectangle(3,5) twice?
* Commented code
* Tests

Explain how getters and setters break encapsulation. They expose the data of a
class to the world, and the only thing we want to expose is behavior.

Behavior is something the class *does*, data is something the class *is*.
Anytime you see a getter, a setter, or a public field it should be a smell.

## Part 2 - Adding Some Requirements

*(20 mins)*

Now ask the students to add `area()` and `perimeter()` methods to their
rectangle.

## Part 3 - Rectangles Are For Squares

*(30 mins)*

Now ask the students to create a square.

Expect several different kinds of solutions to emerge:

**Inheritence**

* How is it different from a rectangle?
* No methods?

**One Argument Constructor**

e.g. `new Rectangle(3)`

* Doesn't express intention; there's no reference to 'square' anywhere.
* Encodes domain logic.

**Factory Method**

e.g. `Rectangle.createSquare(10)`

* Clearer.
* Fewer classes.
* Better expresses intent.

