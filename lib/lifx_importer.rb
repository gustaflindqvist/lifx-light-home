require 'lifx'

client = LIFX::Client.lan                  # Talk to bulbs on the LAN

begin
  client.discover! do |c|
    p c.lights
    c.lights do |l|
      puts l
      $page.store._settings << l
    end
  end
rescue LIFX::Client::DiscoveryTimeout
  return "Could not find any LIFX devices."
end
client.flush
