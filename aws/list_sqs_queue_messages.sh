#!/bin/bash

OUTPUT_FILE="mensagens_sqs.txt"

echo "Enter your queue: "
read QUEUE_URL

echo

echo "Enter your AWS Region: "
read REGION

# Limpa o arquivo de saída
> $OUTPUT_FILE

MESSAGE_COUNT=0

while true; do
    # Recebe mensagens da fila
    MESSAGES=$(aws sqs receive-message --queue-url $QUEUE_URL --max-number-of-messages 10 --region=$REGION --output json)

    # Verifica se houve mensagens
    if [[ "$MESSAGES" == *"Messages"* ]]; then
        echo "$MESSAGES" >> $OUTPUT_FILE
        NUM_MESSAGES=$(echo "$MESSAGES" | jq '.Messages | length')
        MESSAGE_COUNT=$((MESSAGE_COUNT + NUM_MESSAGES))
        echo -e "\rProcessed Messages: $MESSAGE_COUNT"
    else
        echo "Finish!"
        break
    fi
done

echo
echo "Total of mensagens processed: $MESSAGE_COUNT"
