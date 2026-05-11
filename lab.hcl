resource "layout" "main" {
  column {
    tab "terminal" {
      target = resource.terminal.shell
    }
  }

  column {
    instructions {}
  }
}

resource "page" "intro" {
  title = "Getting Started"
  file  = "instructions/intro.md"

  activities = {
    "create_file" = resource.task.create_file
  }
}

resource "lab" "battle_test" {
  title       = "Battle Test - Scripts & Files"
  description = "Lab for testing the Scripts & Files feature."

  settings {
    idle {
      enabled = false
    }
  }

  layout = resource.layout.main

  content {
    chapter "tasks" {
      title = "Tasks"

      page "intro" {
        reference = resource.page.intro
      }
    }
  }
}
