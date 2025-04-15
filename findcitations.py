import re

def extract_citations(tex_file_path):
    # Open the .tex file and read its content
    with open(tex_file_path, 'r', encoding='utf-8') as file:
        content = file.read()

    # Define a regular expression pattern for citations
    citation_pattern = re.compile(r'\\cite{([^}]+)}')

    # Find all matches using the regular expression
    citations = citation_pattern.findall(content)

    # Split citations that are combined using commas within \cite{}
    all_citations = set()
    for citation in citations:
        parts = citation.split(',')
        for part in parts:
            all_citations.add(part.strip())

    return list(all_citations)

def output_nocite_command(citations):
    if citations:
        nocite_command = f"\\nocite{{{','.join(citations)}}}"
        print(nocite_command)
        return nocite_command
    else:
        print("No citations found.")
        return None

def main():
    # Path to the .tex file
    tex_file_path = 'source.tex'

    citations = extract_citations(tex_file_path)
    nocite_command = output_nocite_command(citations)

    if nocite_command:
        # Write the \nocite command to a new file or append to the existing .tex file
        with open('yourfile_with_nocite.tex', 'a', encoding='utf-8') as file:
            file.write(f"\n{nocite_command}\n")

if __name__ == "__main__":
    main()
