package com.ateam.solohomes.ticket;

public interface ITicketDAO {
	int insertCard(String userID, int buyAmount);
	int insertTicket(String userID, int ticketCount);
}
