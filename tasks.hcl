resource "task" "create_file" {
  description = "Create a file with specific content"

  config {
    target = resource.container.ubuntu
  }

  condition "file_created" {
    description = "The file /tmp/hello exists"

    check {
      script          = "scripts/check/file_exists.sh"
      failure_message = "The file /tmp/hello was not found"
    }

    solve {
      script = "scripts/check/solve_file.sh"
    }

    cleanup {
      script = "scripts/check/cleanup_file.sh"
    }
  }

  condition "content_correct" {
    description = "The file contains the word 'world'"

    check {
      script          = "scripts/check/content_match.sh"
      failure_message = "The file does not contain the word 'world'"
    }
  }
}
