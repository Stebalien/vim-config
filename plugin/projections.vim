let g:projectionist_heuristics = {
            \ "Cargo.toml": {
            \   "*": {
            \     "start": "cargo run",
            \     "make": "cargo build"
            \   },
            \ },
            \ "*": {
            \   "*.py": {
            \      "type": "python",
            \      "console": "ipython",
            \      "template": ["#!/usr/bin/python"]
            \   },
            \   "*.sh": {
            \      "type": "bash",
            \      "console": "bash",
            \      "template": ["#!/bin/bash"]
            \   },
            \   "*.rs": {
            \     "type": "rust"
            \   }
            \ }
            \}
