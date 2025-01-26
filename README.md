<h1 align="center">
  <br>
  <a href=""><img src="/img/logo.png" alt="" height="250px;"></a>
  <br>
  <img src="https://img.shields.io/badge/PRs-welcome-blue">
  <img src="https://img.shields.io/github/last-commit/kh4sh3i/Awesome-Code-Review">
  <img src="https://img.shields.io/github/commit-activity/m/kh4sh3i/Awesome-Code-Review">
  <a href="https://twitter.com/intent/follow?screen_name=kh4sh3i_"><img src="https://img.shields.io/twitter/follow/kh4sh3i_?style=flat&logo=twitter"></a>
  <a href="https://github.com/kh4sh3i"><img src="https://img.shields.io/github/stars/kh4sh3i?style=flat&logo=github"></a>
</h1>


# Awesome Code Review
 list of code review resources and tools


## Code Review Tools
- [Axolo](https://www.axolo.co) Github/GitLab Slack integration. Create one ephemeral channel per pull request/ merge request.
- [Crucible](https://www.atlassian.com/software/crucible) Atlassian's on-premise code review tool.
- [Gitpod](https://gitpod.io) Code review pull requests in a full IDE within your browser.
- [LGTM](https://lgtm.com) Automated Git code review for GitHub and Bitbucket pull requests for finding security vulnerabilities and code quality issues.
- [Phabricator](https://www.phacility.com/phabricator/) Open source git/mercurial/svn code review tool originating out of Facebook.
- [PullRequest](https://www.pullrequest.com/) Code review as a service for GitHub pull requests.
- [Reviewable](https://reviewable.io/) Code review tool built on top of GitHub pull requests.
- [Review Board](https://www.reviewboard.org/) Open source review tool that is SCM/platform neutral.
- [Sider](https://sider.review/) Automated code review service for GitHub.
- [SonarCloud](https://sonarcloud.io) Detect code smells, bugs and vulnerabilities in Azure DevOps, Bitbucket and GitHub repositories.
- [Upsource](https://www.jetbrains.com/upsource/) JetBrain's on-premise git/mercurial/perforce/svn code review tool.
- [Viezly](https://viezly.com) Code review service with pull request visualization and enhanced navigation between changes.



## Learning Platforms
- [OWASP's Secure Coding Dojo Example](https://owasp.org/SecureCodingDojo/codereview101)
- [Secure Code Warrior](https://www.securecodewarrior.com/products/training-ground) (paid service with free trial)



# Secure Code Review Checklist
## TLDR;
- [ ] What security vulnerabilities is this code susceptible to?
- [ ] Are authorization and authentication handled in the right way?
- [ ] Is (user) input validated, sanitized, and escaped to prevent cross-site scripting, or SQL injection?
- [ ] Is sensitive data like user data, or credit card information securely handled and stored?
- [ ] Does this code NOT reveal some secret information like keys, passwords, or usernames?
- [ ] Is data retrieved from external APIs or libraries checked accordingly?
- [ ] Does error handling or logging NOT expose the system to vulnerabilities?
- [ ] Is the right encryption used?

## Input Validation
- [ ] Are inputs from external sources validated?
- [ ] Is user input tested for type, length, format, and range, and by enforcing limits?
- [ ] Are flaws in regular expressions causing data validation problems? 
- [ ] Are exact match approaches used? 
- [ ] Are allow list approaches used (i.e., check strings for only expected values)? 
- [ ] Are block list approaches used (i.e., rejected stings for inappropriate values)? 
- [ ] Are XML documents validated against their schemas?
- [ ] Are string concatenations NOT used for user input? 
- [ ] Are SQL statements NOT dynamically created by using user input?
- [ ] Is data validated on the server side?
- [ ] Is there a strong separation between data and commands, and data and client-side scripts?
- [ ] Is contextual escaping used when passing data to SQL, LDAP, OS and third-party commands?
- [ ] Are https headers validated for each request?

## Authentication and User Management
- [ ] Are sessions handled correctly?
- [ ] Do failure messages for invalid usernames or passwords NOT leak information?
- [ ] Are invalid passwords NOT logged (which can leak sensitive password & user name combinations)?
- [ ] Are the password requirements (lengths/complexity) appropriate?
- [ ] Are invalid login attempts correctly handled with lockouts, and rate limits?
- [ ] Does the "forgot password" routine NOT leak information, and is NOT vulnerable to spamming? 
- [ ] Are passwords NOT sent in plain text via email?
- [ ] Are appropriate mechanisms such as hashing, salts, and encryption used for storing passwords and usernames?

## Authorization
- [ ] Are authentication and authorization the first logic executed for each request?
- [ ] Are authorization checks granular (page and directory level)?
- [ ] Is access to pages and data denied by default?
- [ ] Is re-authenticate for requests that have side effects enforced?
- [ ] Are there clear roles for authorization?
- [ ] Can authorization NOT be circumvented by parameter or cookie manipulation?

## Session Management
- [ ] Are session parameters NOT passed in URLs?
- [ ] Do session cookies expire in a reasonably short time?
- [ ] Are session cookies encrypted?
- [ ] Is session data being validated?
- [ ] Is private data in cookies kept to a minimum?
- [ ] Does the application avoid excessive cookie use?
- [ ] Is the session id complex?
- [ ] Is the session storage secure?
- [ ] Does the application properly handle invalid session ids?
- [ ] Are session limits e.g., inactivity timeouts, enforced?
- [ ] Are logouts invalidating the session?
- [ ] Are session resources released when sessions are invalidated?

## Encryption & Cryptography
- [ ] Are state-of-the-art encryption algorithms used (such as FIPS-140)?
- [ ] Are minimum key sizes supported?
- [ ] What types of data must be encrypted?
- [ ] Has sensitive data been secured in memory, storage and transit? 
- [ ] Do restricted areas require SSL? 
- [ ] Is sensitive information passed to/from non-SSL pages?

## Exception Handling
- [ ] Do all methods have appropriate exceptions?
- [ ] Do error messages shown to users NOT reveal sensitive information including stack traces, or ids? 
- [ ] Does the application fail securely when exceptions occur?
- [ ] Are system errors NOT shown to users?
- [ ] Are resources released and transactions rolled back when there is an error?
- [ ] Are all user or system actions are logged?
- [ ] Do we make sure that sensitive information is NOT logged (e.g. passwords)?
- [ ] Do we make sure we have logs or all important user management events (e.g. password reset)?
- [ ] Are unusual activities such as multiple login attempts logged?
- [ ] Do logs have enough detail to reconstruct events for audit purposes?




## Vulnerable Apps
- [Vulnerable Task Manager (vtm)](https://github.com/redpointsec/vtm) : vulnerable task manager in Python/Django, correction not available.
- [OWASP WebGoat](https://github.com/WebGoat/WebGoat) : vulnerable web application with Java backend, correction available.
- [Damn Vulnerable iOS App 1](https://github.com/prateek147/DVIA) : vulnerable iOS app written in Objective-C, correction available.
- [Damn Vulnerable iOS App 2](https://github.com/prateek147/DVIA-v2) : vulnerable iOS app written in Swift, correction available.



## Static Application Security Testing (SAST) Tools
- [OWASP's Source Code Analysis Tools](https://owasp.org/www-community/Source_Code_Analysis_Tools)
- [A curated list of static analysis tools and tools and config files (GitHub)](https://github.com/analysis-tools-dev/static-analysis)
- [Static Application Security Testing Suites used in GitLab's CI/CD](https://docs.gitlab.com/ee/user/application_security/sast/)
- [grepmarx -  A source code static analysis platform for AppSec enthusiasts](https://github.com/Orange-Cyberdefense/grepmarx)
- [Joern - Generate queriable code property graphs](https://joern.io/)
- [Sourcetrail - open-source interactive source explorer](https://github.com/OpenSourceSourceTrail/Sourcetrail)


## best tools :
- [megagrep](https://github.com/claire-lex/megagrep) : find interesting parts of the code to manually check based on keywords. Comes with additional features such as per-file statistics or dev comments search.
- [checkmarx](https://checkmarx.com/) : good tools for cloud and on permise scan 