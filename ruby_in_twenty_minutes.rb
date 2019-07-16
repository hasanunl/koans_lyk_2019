 
require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutAsserts < Neo::Koan

  # about_asserts 

  def test_assert_truth
    assert false                # This should be true
  end

  # To understand reality, we must compare our expectations against
  # reality.
  def test_assert_equality
    expected_value = __
    actual_value = 1 + 1

    assert expected_value == actual_value
  end

  # about_nil

  def test_nil_is_an_object
    assert_equal __, nil.is_a?(Object), "Unlike NULL in other languages"
  end

  def test_nil_has_a_few_methods_defined_on_it
    assert_equal __, nil.nil?
    assert_equal __, nil.to_s
    assert_equal __, nil.inspect

    # THINK ABOUT IT:
    #
    # Is it better to use
    #    obj.nil?
    # or
    #    obj == nil
    # Why?
  end

  # about_objects 

  def test_everything_is_an_object
    assert_equal __, 1.is_a?(Object)
    assert_equal __, 1.5.is_a?(Object)
    assert_equal __, "string".is_a?(Object)
    assert_equal __, nil.is_a?(Object)
    assert_equal __, Object.is_a?(Object)
  end

  def test_every_object_has_an_id
    obj = Object.new
    assert_equal __, obj.object_id.class
  end

  def test_every_object_has_different_id
    obj = Object.new
    another_obj = Object.new
    assert_equal __, obj.object_id != another_obj.object_id
  end

  def test_clone_creates_a_different_object
    obj = Object.new
    copy = obj.clone

    assert_equal __, obj           != copy
    assert_equal __, obj.object_id != copy.object_id
  end

  # about_arrays

  def test_creating_arrays
    empty_array = Array.new
    assert_equal __, empty_array.class
    assert_equal __, empty_array.size
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0]
    assert_equal __, array.first
    assert_equal __, array[3]
    assert_equal __, array.last
    assert_equal __, array[-1]
    assert_equal __, array[-3]
  end

  def test_arrays_and_ranges
    assert_equal __, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal __, (1..5).to_a
    assert_equal __, (1...5).to_a
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal __, array[0,1]
    assert_equal __, array[0,2]
    assert_equal __, array[2,2]
    assert_equal __, array[2,20]
    assert_equal __, array[4,0]
    assert_equal __, array[4,100]
    assert_equal __, array[5,0]
    assert_equal __, array[0..2]
    assert_equal __, array[0...2]
    assert_equal __, array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal __, array

    popped_value = array.pop
    assert_equal __, popped_value
    assert_equal __, array
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal __, array

    shifted_value = array.shift
    assert_equal __, shifted_value
    assert_equal __, array
  end

  # about_hashes

  def test_creating_hashes
    empty_hash = Hash.new
    assert_equal __, empty_hash.class
    assert_equal(__, empty_hash)
    assert_equal __, empty_hash.size
  end

  def test_accessing_hashes
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash[:one]
    assert_equal __, hash[:two]
    assert_equal __, hash[:doesnt_exist]
  end

  def test_changing_hashes
    hash = { :one => "uno", :two => "dos" }
    hash[:one] = "eins"

    expected = { :one => __, :two => "dos" }
    assert_equal __, hash

    # Bonus Question: Why was "expected" broken out into a variable
    # rather than used as a literal?
  end

  def test_hash_is_unordered
    hash1 = { :one => "uno", :two => "dos" }
    hash2 = { :two => "dos", :one => "uno" }

    assert_equal __, hash1 == hash2
  end

  def test_hash_keys
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.keys.size
    assert_equal __, hash.keys.include?(:one)
    assert_equal __, hash.keys.include?(:two)
    assert_equal __, hash.keys.class
  end

  def test_hash_values
    hash = { :one => "uno", :two => "dos" }
    assert_equal __, hash.values.size
    assert_equal __, hash.values.include?("uno")
    assert_equal __, hash.values.include?("dos")
    assert_equal __, hash.values.class
  end

  def test_default_value
    hash1 = Hash.new
    hash1[:one] = 1

    assert_equal __, hash1[:one]
    assert_equal __, hash1[:two]

    hash2 = Hash.new("dos")
    hash2[:one] = 1

    assert_equal __, hash2[:one]
    assert_equal __, hash2[:two]
  end

  # about_strings

  def test_double_quoted_strings_are_strings
    string = "Hello, World"
    assert_equal __, string.is_a?(String)
  end

  def test_single_quoted_strings_are_also_strings
    string = 'Goodbye, World'
    assert_equal __, string.is_a?(String)
  end

  def test_use_single_quotes_to_create_string_with_double_quotes
    string = 'He said, "Go Away."'
    assert_equal __, string
  end

  def test_use_double_quotes_to_create_strings_with_single_quotes
    string = "Don't"
    assert_equal __, string
  end

  def test_use_backslash_for_those_hard_cases
    a = "He said, \"Don't\""
    b = 'He said, "Don\'t"'
    assert_equal __, a == b
  end

  def test_plus_will_concatenate_two_strings
    string = "Hello, " + "World"
    assert_equal __, string
  end

  def test_double_quoted_strings_interpolate_variables
    value = 123
    string = "The value is #{value}"
    assert_equal __, string
  end

  def test_you_can_get_a_substring_from_a_string
    string = "Bacon, lettuce and tomato"
    assert_equal __, string[1]
    assert_equal __, string[7,3]
    assert_equal __, string[7..9]
  end

  def test_strings_can_be_split
    string = "Sausage Egg Cheese"
    words = string.split
    assert_equal [__, __, __], words
  end

  def test_strings_can_be_joined
    words = ["Now", "is", "the", "time"]
    assert_equal __, words.join(" ")
  end

  def test_strings_are_unique_objects
    a = "a string"
    b = "a string"

    assert_equal __, a           == b
    assert_equal __, a.object_id == b.object_id
  end

  # about_symbols

  def test_symbols_are_symbols
    symbol = :ruby
    assert_equal __, symbol.is_a?(Symbol)
  end

  def test_symbols_can_be_compared
    symbol1 = :a_symbol
    symbol2 = :a_symbol
    symbol3 = :something_else

    assert_equal __, symbol1 == symbol2
    assert_equal __, symbol1 == symbol3
  end

  def test_identical_symbols_are_a_single_internal_object
    symbol1 = :a_symbol
    symbol2 = :a_symbol

    assert_equal __, symbol1           == symbol2
    assert_equal __, symbol1.object_id == symbol2.object_id
  end

  def test_method_names_become_symbols
    symbols_as_strings = Symbol.all_symbols.map { |x| x.to_s }
    assert_equal __, symbols_as_strings.include?("test_method_names_become_symbols")
  end

  # THINK ABOUT IT:
  #
  # Why do we convert the list of symbols to strings and then compare
  # against the string value rather than against symbols?


  # about_regular_expressions

  def test_a_pattern_is_a_regular_expression
    assert_equal __, /pattern/.class
  end

  def test_a_regexp_can_search_a_string_for_matching_content
    assert_equal __, "some matching content"[/match/]
  end

  # about_methods

  def my_global_method(a,b)
    a + b
  end

  def test_calling_global_methods
    assert_equal __, my_global_method(2,3)
  end

  def test_calling_global_methods_without_parentheses
    result = my_global_method 2, 3
    assert_equal __, result
  end

  # ------------------------------------------------------------------

  def method_with_defaults(a, b=:default_value)
    [a, b]
  end

  def test_calling_with_default_values
    assert_equal [1, __], method_with_defaults(1)
    assert_equal [1, __], method_with_defaults(1, 2)
  end

  # ------------------------------------------------------------------

  def method_with_var_args(*args)
    args
  end

  def test_calling_with_variable_arguments
    assert_equal __, method_with_var_args.class
    assert_equal __, method_with_var_args
    assert_equal __, method_with_var_args(:one)
    assert_equal __, method_with_var_args(:one, :two)
  end

  # ------------------------------------------------------------------

  class Dog
    def name
      "Fido"
    end

    private

    def tail
      "tail"
    end
  end

  def test_calling_methods_in_other_objects_require_explicit_receiver
    rover = Dog.new
    assert_equal __, rover.name
  end

  def test_calling_private_methods_in_other_objects
    rover = Dog.new
    assert_raise(___) do
      rover.tail
    end
  end

  # about_constants

  C = "nested"

  def test_nested_constants_may_also_be_referenced_with_relative_paths
    assert_equal __, C
  end

  # about_control_statements

  def test_if_then_else_statements
    if true
      result = :true_value
    else
      result = :false_value
    end
    assert_equal __, result
  end

  def test_condition_operators
    assert_equal __, (true ? :true_value : :false_value)
    assert_equal __, (false ? :true_value : :false_value)
  end

  def test_if_statement_modifiers
    result = :default_value
    result = :true_value if true

    assert_equal __, result
  end

  # about_iteration
  
  def test_iterating_with_each
    array = [1, 2, 3]
    sum = 0
    array.each do |item|
      sum += item
    end
    assert_equal __, sum
  end

  def test_each_can_use_curly_brace_blocks_too
    array = [1, 2, 3]
    sum = 0
    array.each { |item| sum += item }
    assert_equal __, sum
  end

end
