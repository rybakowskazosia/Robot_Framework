*** Settings ***
Library  ImapLibrary2

*** Variables ***
${IMAP host}  imap.wp.pl
${username}  z.rybakowska8@wp.pl
${password}  Robotframework
${search}  SUBJECT "test email.robot"

*** Test Cases ***
Download Email
  Open Mailbox  host=${IMAP host}  user=${username}  password=${password}  port=993

  # Oznacz wszystkie wiadomości jako przeczytane, aby uniknąć powtórnego pobierania
  Mark All Emails As Read

  # Pobierz liczbę wiadomości w skrzynce
  ${email_count}=  Get Email Count

  # Przeszukaj wszystkie wiadomości
  :FOR  ${index}  IN RANGE  ${email_count}
  \  ${email_index}=  Evaluate  ${index} + 1
  \  ${email_subject}=  Get Email Header  Subject  ${email_index}

  \  # Jeśli znaleziono wiadomość o określonym temacie, to kontynuuj
  \  Run Keyword If  '${email_subject}' == '${search}'
  \  \  Log  Found email with subject '${search}' at index ${email_index}
  \  \  Select Email  ${email_index}
  \  \  ${email_body}=  Get Email Body  plain
  \  \  ${links}=  Get Links From Email  ${email_body}
  \  \  Log Many  Links found:\n@{links}
  \  \  Close Mailbox
  \  \  Exit For Loop If  True  # Przerwij pętlę po znalezieniu pierwszej wiadomości o określonym temacie

  Close Mailbox




# *** Test Cases ***
# Download Email
#   Open Mailbox  host=${IMAP host}  user=${username}  password=${password}  port=993
#   ${email_search}=  Search Messages  SUBJECT:${search}
#   ${latest_email}=  Get Message List  ${email_search}
#   ${latest_email_id}=  Get From List  ${latest_email}  -1
#   Select Email  ${latest_email_id}
#   ${email_subject}=  Get Email Header  Subject
#   ${email_body}=  Get Email Body  plain
#   Log  Content of message with subject '${email_subject}':\n${email_body}
#   ${links}=  Open Link From Email  ${email_body}
#   Log Many  Links found:\n@{links}
#   Close Mailbox


