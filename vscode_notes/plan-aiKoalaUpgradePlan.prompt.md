# ai-koala-upgrade-plan

Plan: React 19 Upgrade Checklist (AI-Ready)
Excellent direction. I created a complete execution checklist and saved it to /memories/session/plan.md so you can reuse it directly with an AI agent.

Here is the practical version you can copy/paste immediately.

Preflight
 Create branch from latest main
 Confirm Node/npm versions for local + CI
 Capture baseline:
npm ci
npm run lint
npm run build
npm run dev
 Capture baseline smoke evidence:
login
qc-review summary + gate page
qc-record summary + gate page
 Confirm first-wave scope excludes router-major migration
PR 1: Internal UI version bump
 Bump @twist/nucleic-ui-components in mes-koala/package.json
 Install and record peer/deprecation warnings
 Fix any import breakage from @twist/nucleic-ui-components/dist usages (58 call sites)
 Validate style imports still resolve
 Run lint/build/dev smoke
 Document API/export changes required by new UI package
PR 2: React 19 runtime
 Upgrade react and react-dom
 Upgrade @types/react and @types/react-dom
 Migrate mes-koala/src/main.tsx from ReactDOM.render to createRoot
 Verify StrictMode behavior for listener side effects in mes-koala/src/components/root.tsx and mes-koala/src/utils/comm.ts
 Run lint/build/dev smoke
PR 3: Toolchain modernization
 Upgrade vite + @vitejs/plugin-react
 Upgrade typescript
 Upgrade eslint, @typescript-eslint/parser, @typescript-eslint/eslint-plugin
 Update JSX runtime mode in mes-koala/tsconfig.json
 Resolve new lint/type diagnostics
 Run lint/build/dev smoke
PR 4: Cleanup + stabilization
 Remove temporary shims/debug logs
 Normalize internal UI imports to public exports where feasible
 Recreate lockfile from clean install
 Validate reproducibility:
clean clone -> npm ci -> npm run build
 Final smoke pass
Optional PR 5: Router major migration
 Migrate v5 APIs in mes-koala/src/App.tsx, mes-koala/src/qc-review/index.tsx, mes-koala/src/qc-record/index.tsx
 Switch -> Routes, Redirect -> Navigate, withRouter/RouteComponentProps -> hooks/types
 Validate nested params/routes
 Run full route smoke matrix
Command gates per PR
npm ls react react-dom @twist/nucleic-ui-components react-router-dom
npm outdated
npm run lint
npm run build
npm run dev
AI prompts you can reuse
PR 1 prompt
Upgrade @twist/nucleic-ui-components in mes-koala to the latest version with React 19 peers. Keep current React version if possible. Fix all import/export breakages, especially deep imports from @twist/nucleic-ui-components/dist, ensure style imports resolve, then run lint/build and list changed files plus remaining warnings.

PR 2 prompt
Migrate mes-koala runtime to React 19 by updating react, react-dom, @types/react, and @types/react-dom. Replace ReactDOM.render with createRoot in main.tsx. Validate StrictMode does not cause duplicate listener behavior and run lint/build with a risk summary.

PR 3 prompt
Modernize the React toolchain in mes-koala: upgrade vite, @vitejs/plugin-react, typescript, eslint, @typescript-eslint/parser, and @typescript-eslint/eslint-plugin as a compatible set. Update tsconfig JSX runtime mode, fix resulting type/lint issues, and verify lint/build/dev.

PR 4 prompt
Perform post-upgrade cleanup in mes-koala: remove temporary shims/logging, normalize internal UI imports to public exports where available, verify clean install lockfile stability, and run lint/build with final regression checklist results.

Optional PR 5 prompt
Migrate mes-koala from react-router-dom v5 to the latest major in a standalone PR. Refactor Switch/Redirect/withRouter/RouteComponentProps to modern APIs, verify nested route params, and run full route smoke tests.