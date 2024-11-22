
#!/bin/bash

# Export results to file
output_file="tabelas_dynamodb.txt"

# Set AWS Region
echo "Insert your AWS Region ex: (us-east-1) :"
read region

aws dynamodb list-tables --query "TableNames[]" --region $region  --output json | jq -r '.[]' > "$output_file"

echo "Saved DynamoDB tables in $output_file!"

# List tables of output file
echo "Listando tabelas do arquivo:"
while IFS= read -r tabela; do
    echo "$tabela"
done < "$output_file"
