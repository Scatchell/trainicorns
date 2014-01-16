---
layout: default
title: Lab 3 - Quantity
type: lab
objectives:
    - Understand a good example of using the fewest classes possible
    - Be able to see when to use types over conditionals
    - Understand when to use checked and unchecked exceptions
    - Be able to text exceptions

---

## Part 1 - When is 3 != 3?

*(1:25 hours, 20 mins design, 45 mins code, 20 mins discussion)*

Ask the students to think about numbers with units. A mars satellite was lost
due to mismatching units &mdash; imperial and metric. What could we do in code
to prevent this in the future?

Write the following table on the white board defining the relationships between
units of length in the imperial system:

<table>
    <thead>
        <th>Unit</th>
        <th>Equivalence</th>
    </thead>
    <tbody>
        <tr>
            <td>1 mile</td>
            <td>1760 yards</td>
        </tr>
        <tr>
            <td>1 yard</td>
            <td>3 feet</td>
        </tr>
        <tr>
            <td>1 foot</td>
            <td>12 inches</td>
        </tr>
    </tbody>
</table>

Solicit a design discussion about how they might model these relationships, it
should only take 5 or 10 minutes. Remind them that the goal of design time is
not to find the ultimate, perfect-and-infallible, design. Instead we're trying
to explore a decent start.

A good technique is to think about what your first test might be, then work
from there.

Common mistakes to be aware of:

* A class encapsulating both amount and unit, e.g. `Quantity`
* Representing a unit as a string, or a `final int`. Any value could be passed
    in, but there are a finite set of valid units.
* Separate classes for `Feet` and `Yard`, etc. Is the behavior any different?
    How much of it is duplicated?
* A `Unit` class that simply returns the conversion factor.

```
class Unit {
    public final int conversionFactor;

    public Unit(int conversionFactor) {
        this.conversionFactor = conversionFactor
    }

    // etc...
}

class Quantity {
    public boolean equal(Object other) {
        // boilerplate

        // This is very common! The unit should be responsible for the
        // conversion, though.
        return (this.unit.conversionFactor * this.value) ==
            (other.unit.conversionFactor * other.value);
    }
}
```

After students have finished with their implementations, and there's been a
discussion around design, refactor to a standard solution before proceeding.

* One `Unit` enumeration/class with a variable for conversion to a base unit.
* `Unit` has a private constructor and is immutable.
* `Quantity` class stores an amount and a `Unit`.
* `Quantity` *delegates* to `Unit`. `Unit` doesn't know anything about
    `Quantity`

## Part 2 - This Code Goes to 11!

Introduce a unit for a totally different form of measurement: volume.

<table>
    <thead>
        <th>Unit</th>
        <th>Equivalence</th>
    </thead>
    <tbody>
        <tr>
            <td>1 cup</td>
            <td>8 oz</td>
        </tr>
        <tr>
            <td>1 oz</td>
            <td>2 tbsp</td>
        </tr>
        <tr>
            <td>1 tbsp</td>
            <td>3 tsp</td>
        </tr>
    </tbody>
</table>

Ask them to add volume to their current implementation.

Common mistakes to be aware of:

* Inheritence is not necessary, but is a very common solution to the problem.
    * Instead look for a `UnitType` on `Unit`

## Part 3 - Combine All the Things!

Ask the students to implement adding quantities together, e.g.

    new Quantity(1, Unit.Yards).add(new Quantity(2, Unit.Miles));

Common mistakes to be aware of:

* Throwing a `RuntimeException` in the `add()` method when trying to add
    quantities with incompatible units.
* Use exceptions for exceptional cases only, when the program is in a state
    that it should not be in. Do not use them for flow control.

Particularly around unchecked exceptions:

* If a programmer could check for the issue before calling `add()` then it can
    be thrown as a `RuntimeException`. In other words if the programmer could
    have avoided the error then a `RuntimeException` can be thrown.
* This has to be balanced against bleeding the interface. For example an `Stock`
    class interface should not show a `SQLException`. This can be done by
    wrapping exceptions either with checked or runtime exceptions.
* The only option to get rid of the runtime exception would be to introduce many
    subclasses for each type of `Quantity` (length, temperature, etc). This
    would be bad because it would be (1) an explosion of subclasses and (2)
    they wouldn't have any different behaviour.

