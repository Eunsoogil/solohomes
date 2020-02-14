package com.ateam.solohomes.commnad;

import org.springframework.ui.Model;

public interface Command {
	void execute(Model model);
}
