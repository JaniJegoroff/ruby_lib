
# common methods
def back_click(opts = {})
  opts ||= {}
  search_wait = opts.fetch(:wait, 60 * 1.7)
  # iOS may have multiple 'back' buttons
  # select the first displayed? back button.
  wait(search_wait) do
    button_exact('Back').click
  end
end

def leave_textfields
  back_click
  screen.must_equal catalog
end

def go_to_textfields
  screen.must_equal catalog
  wait_true do
    text('textfield').click
    screen == 'TextFields' # wait for screen transition
  end

  screen.must_equal 'TextFields'
end

def screen
  $driver.find_element(:class, 'UIANavigationBar').name
end

def catalog
  'UICatalog'
end

module UI
  module Inventory
    private

    def self.xcuitest?
      $driver.automation_name && $driver.automation_name == 'xcuitest'
    end

    public

    def self.navbar
      if xcuitest?
        'XCUIElementTypeNavigationBar'
      else
        'UIANavigationBar'
      end
    end

    def self.button
      if xcuitest?
        'XCUIElementTypeButton'
      else
        'UIAButton'
      end
    end

    def self.static_text
      if xcuitest?
        'XCUIElementTypeStaticText'
      else
        'UIAStaticText'
      end
    end

    def self.text_field
      if xcuitest?
        'XCUIElementTypeTextField'
      else
        'UIATextField'
      end
    end

    def self.secure_text_field
      if xcuitest?
        'XCUIElementTypeSecureTextField'
      else
        'UIASecureTextField'
      end
    end

    def self.picker
      if xcuitest?
        'XCUIElementTypePicker'
      else
        'UIAPicker'
      end
    end

    def self.action_sheet
      if xcuitest?
        'XCUIElementTypeActionSheet'
      else
        'UIActionSheet'
      end
    end

    def self.table
      if xcuitest?
        'XCUIElementTypeTable'
      else
        'UIATable'
      end
    end

    def self.table_cell
      if xcuitest?
        'XCUIElementTypeCell'
      else
        'UIATableCell'
      end
    end

    def self.other
      if xcuitest?
        'XCUIElementTypeOther'
      else
        fail 'unknown UIA element: other'
      end
    end

    def self.status_bar
      if xcuitest?
        'XCUIElementTypeStatusBar'
      else
        'UIAStatusBar'
      end
    end
  end
end
