# xmdltz

This repository currently contains automation configuration for the project,
including Crowdin synchronization workflows.

## Hermes-agent troubleshooting

Linear issue SAN-11 reported that `/hermes-agent` failed while loading the
`hermes-agent` skill because calls to the Hugging Face router returned HTTP
`402 Payment Required` for `Qwen/Qwen3-Coder-Next`.

The error means the Hugging Face account or organization used by the agent has
exhausted its included Inference Providers credits. This is an environment or
billing configuration issue, not a repository code failure.

To restore the Hermes-agent session:

1. Add prepaid credits or enable the required paid billing plan for the Hugging
   Face account or organization used by the agent token.
2. If the token should bill an organization, configure the agent runtime to send
   the appropriate Hugging Face billing organization header, such as
   `X-HF-Bill-To`, when supported by the provider path.
3. Alternatively, switch the agent runtime to another configured model provider
   with available quota.
4. Re-run `/hermes-agent` after updating billing or provider configuration.

Keep agent provider credentials and billing headers in the runtime environment
or secret store. Do not commit tokens, API keys, or billing secrets to this
repository.
