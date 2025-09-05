{ config, pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    
    connectionConfig = {
      "eduroam" = {
        connection = {
          id = "eduroam";
          type = "wifi";
          autoconnect = "true";
          autoconnect-priority = "1";
        };
        
        wifi = {
          mode = "infrastructure";
          ssid = "eduroam";
        };
        
        wifi-security = {
          auth-alg = "open";
          key-mgmt = "wpa-eap";
        };
        
        "802-1x" = {
          eap = "tls";
          identity = "ngysling@UDel.Edu";
          ca-cert = "/etc/ssl/certs/globalsign.cer";
          client-cert = "/etc/ssl/certs/eduroam-client.p12";
          private-key = "/etc/ssl/private/eduroam-client.p12";
          private-key-password = "FuckEduroam1";  # hogcycle don't caare 
        };
        
        ipv4 = {
          method = "auto";
        };
        
        ipv6 = {
          method = "auto";
          addr-gen-mode = "stable-privacy";
        };
      };
    };
  };
}
