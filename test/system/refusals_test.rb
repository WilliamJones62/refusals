require "application_system_test_case"

class RefusalsTest < ApplicationSystemTestCase
  setup do
    @refusal = refusals(:one)
  end

  test "visiting the index" do
    visit refusals_url
    assert_selector "h1", text: "Refusals"
  end

  test "creating a Refusal" do
    visit refusals_url
    click_on "New Refusal"

    fill_in "Invoice numb", with: @refusal.invoice_numb
    fill_in "Part code", with: @refusal.part_code
    fill_in "Qty", with: @refusal.qty
    click_on "Create Refusal"

    assert_text "Refusal was successfully created"
    click_on "Back"
  end

  test "updating a Refusal" do
    visit refusals_url
    click_on "Edit", match: :first

    fill_in "Invoice numb", with: @refusal.invoice_numb
    fill_in "Part code", with: @refusal.part_code
    fill_in "Qty", with: @refusal.qty
    click_on "Update Refusal"

    assert_text "Refusal was successfully updated"
    click_on "Back"
  end

  test "destroying a Refusal" do
    visit refusals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Refusal was successfully destroyed"
  end
end
