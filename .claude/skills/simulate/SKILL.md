# Simulate: Create Your Personalized Learning Scenario

This skill guides users through creating a simulated company environment that mirrors their real work challenges—without using any actual confidential data.

## Purpose

Many executives can't enter real company data into AI tools due to confidentiality. This skill creates a realistic fictional scenario based on their actual work context, generating 30+ documents (memos, emails, CSVs, Slack messages, reports) they can use for hands-on practice.

## Invocation

- `/simulate` - Start creating a new simulation or modify an existing one

## Workflow

### Phase 1: Check for Existing Simulation

First, check if `workspace/projects/` contains any previous simulation folders (folders starting with `simulation-`).

If previous simulations exist:
- List them with their dates
- Ask: "I see you have an existing simulation. Would you like to:"
  - **Start fresh** - Create a completely new scenario
  - **Modify existing** - Add documents or adjust your current simulation
  - **Or tell me what you'd prefer**

### Phase 2: Guided Discovery (Q&A)

Use the AskUserQuestion tool throughout this phase. Always mix open-ended questions with multiple-choice options. **Every multiple-choice question must include a final option like "Or enter your own answer"** so users never feel constrained.

**Important**: Remind users periodically that they can share as much or as little detail as they want, and that everything will be fictionalized.

#### 2.1 Work Challenges & Goals

Start with:
> "Let's create a simulation that feels relevant to your real work. What's a key challenge or goal you're working on right now? This could be AI-related, operational, strategic—anything you'd like to practice tackling with AI assistance."

Follow up to understand:
- **Urgency**: "How urgent is this issue?"
  - Crisis mode - needs resolution immediately
  - High priority - significant focus over next quarter
  - Important but not urgent - strategic initiative
  - Exploratory - just thinking about it
  - Or describe the timeline yourself

- **Scale/Impact**: "How big is this issue for your organization?"
  - Company-wide transformation
  - Major department or business unit initiative
  - Team-level project
  - Personal productivity improvement
  - Or describe the scope yourself

#### 2.2 Your Role & Company Context

Ask about their role:
> "What's your role? (We'll create a similar fictional title)"

Offer options like:
- C-Suite (CEO, CFO, CTO, COO, etc.)
- SVP / VP level
- Director / Senior Director
- Department Head / Manager
- Or describe your role

**Industry**:
> "What industry do you work in?"

If they mention an industry, respond:
> "Would you like the simulation set in that industry? I can also suggest similar industries if you'd prefer some distance from your actual work:"
- [Their stated industry]
- [Similar industry option 1]
- [Similar industry option 2]
- Or name a different industry

**Company Size** (ask both):

Revenue:
- Under $100M
- $100M - $500M
- $500M - $1B
- $1B - $10B
- $10B+
- Or specify a different size

Employees:
- Under 500
- 500 - 2,000
- 2,000 - 10,000
- 10,000 - 50,000
- 50,000+
- Or specify a number

**Department**:
> "What department or function do you work in?"
- Operations
- Finance
- Technology / IT
- Sales
- Marketing
- HR / People
- Strategy
- Product
- Or name your department

#### 2.3 The People Involved

> "Who are the key people involved in this challenge? Don't use real names—just describe their roles and how they relate to the issue."

Ask about:
- Who reports to you on this?
- Who do you report to?
- Who are the stakeholders or skeptics?
- Any external parties (vendors, consultants, board members)?

#### 2.4 The Company Name

> "Let's name your fictional company. Here are some options, or create your own:"

Generate 3-4 contextually appropriate names based on their industry. Always end with:
- Or name it yourself

#### 2.5 Document Types

> "What kinds of documents and communications typically influence your work on challenges like this?"

Offer options (allow multiple selections):
- Email threads
- Slack/Teams messages
- Executive memos
- Board presentations
- Financial reports / spreadsheets
- Project status updates
- Vendor proposals
- Meeting notes
- Strategic plans
- Customer feedback / surveys
- Or describe other document types

### Phase 3: Sample Generation & Validation

Before generating the full document set:

1. Generate 2-3 sample documents based on what you've learned
2. Show them to the user
3. Ask: "Do these feel realistic? Should I adjust the tone, complexity, or focus?"

Iterate until they confirm the direction is right.

### Phase 4: Full Document Generation

Generate 30+ documents (or more if the scenario warrants). Include a realistic mix:

**Suggested distribution** (adjust based on their input):
- 5-8 email threads (varying lengths, different senders)
- 3-5 Slack/Teams conversation excerpts
- 2-3 executive memos
- 2-3 meeting notes
- 3-5 CSV data files (metrics, KPIs, survey results, etc.)
- 2-3 reports or presentations
- 2-3 project updates or status reports
- 2-3 documents specific to their challenge (vendor proposals, board questions, etc.)

**File organization**:
Create a dated folder: `workspace/projects/simulation-YYYY-MM-DD/`

Inside, organize by type:
```
simulation-YYYY-MM-DD/
├── PERSONA.md          # Their fictional identity and assignment
├── emails/
├── slack/
├── memos/
├── reports/
├── data/
├── meetings/
└── other/
```

### Phase 5: Create the Persona Card

Create `PERSONA.md` with this structure:

```markdown
# Your Simulation Persona

## You Are:
**[Fictional Name]**, [Fictional Title] at **[Company Name]**

[Brief bio that mirrors their real role without identifying details]

## Your Company:
[Company Name] is a [size] [industry] company with [X] employees and approximately $[Y] in annual revenue.

[2-3 sentences about the company that make it feel real]

## Your Assignment:
[Clear description of the challenge they need to tackle, written as if it's their actual job assignment]

## Key Players:
- **[Name]** - [Role] - [Brief description]
- **[Name]** - [Role] - [Brief description]
[etc.]

## Available Documents:
Your `simulation-YYYY-MM-DD/` folder contains [X] documents including:
- [Summary of what's included]

## Getting Started:
1. Review the documents in your simulation folder
2. Ask Claude to help you tackle your assignment
3. Practice the skills you're learning with realistic context

---
*This simulation was created on [date]. To create a new simulation, run `/simulate` again.*
```

### Phase 6: Wrap-Up

After generating everything:

1. Explain what was created and where to find it
2. Show them how to view the PERSONA.md file:
   > "To see your persona and assignment, you can ask me to 'show my persona' or open the file at `workspace/projects/simulation-YYYY-MM-DD/PERSONA.md`"
3. Suggest next steps:
   > "You can now use these documents to practice with Claude. Try asking me to help you with your assignment, analyze the data, draft responses to emails, or prepare for meetings."

## Key Principles

1. **Always ask, never assume** - When in doubt, ask another question
2. **Offer options AND flexibility** - Multiple choice with "or enter your own"
3. **Validate with samples** - Show examples before generating everything
4. **Explain everything** - This user is learning; be verbose about what you're doing and why
5. **Keep it fictional** - Never use real names, real company names, or identifiable details
6. **Make it feel real** - The more realistic the simulation, the more valuable the practice
