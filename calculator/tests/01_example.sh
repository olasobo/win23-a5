#!/usr/bin/env bash

# (The absolute path to the program is provided as the first and only argument.)
CALCULATOR=$1

echo "We've set up a GitHub Actions Workflow that will run all"
echo "of the shell scripts in this directory as a series of tests."
echo
echo "To fail any test, you should use the exit 1 command;"
echo "To end a test early as a success, you should use the exit 0 command."

echo "Invoke your program with the \$CALCULATOR variable; an example is below"


# Test 01: Ensure the program runs without error with a simple, valid invocation.
if ! $CALCULATOR 1 + 1; then  # If the return code of $PROGRAM is non-zero (i.e. error)...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed!'
  exit 1
fi

# Test 02: Ensure simple case has correct output...
if [[ $($CALCULATOR 1 + 1) -ne 2 ]]; then  # If the output of the program is not 2...
  echo 'ERROR! A valid run of the calculator (1 + 1) failed to produce 2 as an output!'
  exit 1
fi

# Test 03: Ensure program errors with an invalid operand
if $CALCULATOR 3 @ 2; then  # If the return code of $PROGRAM is zero (i.e. success)...
  echo 'ERROR! An invalid run of the application (3 @ 2) apparently succeeded?!'
  exit 1
fi

# -- MY TESTS --
# Test 04: Tests -q flag
if ! $CALCULATOR -q 6 / 2; then
  echo 'ERROR! Does not handle the -q flag!'
  exit 1
fi

# Test 05: Ensure correct output for valid input
if [[ $($CALCULATOR 5 "*" 3) -ne 15 ]]; then
  echo 'ERROR! Produced wrong output for (5 * 3)!'
  exit 1
fi

# Test 06: Tests with extra inputs
if ! $CALCULATOR 10 - 4 bogus; then
  echo 'ERROR! Failed to ignore extra input values!'
  exit 1
fi
