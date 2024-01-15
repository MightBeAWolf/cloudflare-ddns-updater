.PHONY: install

SERVICE_FILE=cloudflare-ddns.service
TIMER_FILE=cloudflare-ddns.timer
SYSTEMD_DIR=/etc/systemd/system

install:
	op inject -i systemd/$(SERVICE_FILE) \
		|  sudo tee $(SYSTEMD_DIR)/$(SERVICE_FILE) >/dev/null
	op inject -i systemd/$(TIMER_FILE) \
		|  sudo tee $(SYSTEMD_DIR)/$(TIMER_FILE) >/dev/null
	sudo systemctl daemon-reload
	sudo systemctl start $(TIMER_FILE)

