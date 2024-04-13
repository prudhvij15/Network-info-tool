track_ip() {
    while true; do
        read -p "Enter IP Address to track: " ip_address

        # Validate the IP address
        if [[ ! $ip_address =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            echo "Error: Invalid IP address format. Please try again."
        else
            # Perform geolocation lookup
            res=$(curl http://ip-api.com/json/$ip_address -s)
			
            # Check if the response is successful
            status=$(echo $res | jq '.status' -r)
            if [[ $status == "success" ]]; then
                # Extract and display geolocation information
		ip
                city=$(echo $res | jq '.city' -r)
                region=$(echo $res | jq '.regionName' -r)
                country=$(echo $res | jq '.country' -r)
                latitude=$(echo $res | jq '.lat' -r)
                longitude=$(echo $res | jq '.lon' -r)
                isp=$(echo $res | jq '.isp' -r)

                # Display formatted output
                echo "Geolocation Information for IP Address $ip_address:"
                echo "----------------------------------------------------"
                echo "City:          $city"
                echo "Region:        $region"
                echo "Country:       $country"
                echo "Latitude:      $latitude"
                echo "Longitude:     $longitude"
                echo "ISP:           $isp"
            else
                echo "Error: Failed to retrieve geolocation information."
            fi

            # Exit the loop after processing
            break
        fi
    done
}
