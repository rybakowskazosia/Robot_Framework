*** Settings ***
Library  ImapLibrary2

*** Variables ***
${IMAP host}  imap.gmail.com
${username}  zosiarybakowska8@gmail.com
${password}  RobotFramework
${search}  SUBJECT "test email.robot"

*** Test Cases ***
Download Email
  Open Mailbox  
  Login  ${username}  ${password}
  ${email_search}=  Search Messages  ${search}
  ${latest_email}=  Get From List  ${email_search}  -1
  Select Message  ${latest_email}
  ${email_subject}=  Get Message Header  Subject
  ${email_body}=  Get Message Body  plain
  Log  Content of message with subject '${email_subject}':\n${email_body}
  ${links}=  Get Links From Email Body  ${email_body}
  Log Many  Links found:\n@{links}
  Close Mailbox


 