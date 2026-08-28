PORTNAME=	codex
DISTVERSIONPREFIX=	rust-v
DISTVERSION=	0.149.0
PORTREVISION=	1
CATEGORIES=	ai devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight coding agent that runs in your terminal
WWW=		https://openai.com/codex \
		https://github.com/openai/codex

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

BROKEN_i386=	fails to build: rustc-LLVM ERROR: out of memory

BUILD_DEPENDS=	${RUST_DEFAULT}>=1.95.0:lang/${RUST_DEFAULT} \
		gn>=2345:devel/gn \
		protoc:devel/protobuf
LIB_DEPENDS=	libzstd.so:archivers/zstd \
		libasound.so:audio/alsa-lib \
		libdbus-1.so:devel/dbus \
		libonig.so:devel/oniguruma
RUN_DEPENDS=	bash:shells/bash \
		rg:textproc/ripgrep
TEST_DEPENDS=	bash:shells/bash

USES=		cargo gnome llvm:min=21 ninja:build python:test \
		shebangfix ssl

CARGO_BUILDDEP=	no
WITHOUT_LTO=	yes

USE_GITHUB=	yes
GH_ACCOUNT=	openai

USE_GNOME=	glib20

SHEBANG_FILES=	codex-rs/app-server-protocol/scripts/write_schema_fixtures.py \
		codex-rs/skills/src/assets/samples/imagegen/scripts/image_gen.py \
		codex-rs/skills/src/assets/samples/imagegen/scripts/remove_chroma_key.py \
		codex-rs/skills/src/assets/samples/plugin-creator/scripts/create_basic_plugin.py \
		codex-rs/skills/src/assets/samples/plugin-creator/scripts/identifier_validation.py \
		codex-rs/skills/src/assets/samples/plugin-creator/scripts/read_marketplace_name.py \
		codex-rs/skills/src/assets/samples/plugin-creator/scripts/update_plugin_cachebuster.py \
		codex-rs/skills/src/assets/samples/plugin-creator/scripts/validate_plugin.py \
		codex-rs/skills/src/assets/samples/skill-creator/scripts/generate_openai_yaml.py \
		codex-rs/skills/src/assets/samples/skill-creator/scripts/init_skill.py \
		codex-rs/skills/src/assets/samples/skill-creator/scripts/quick_validate.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/github_utils.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/install-skill-from-github.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/list-skills.py \
		codex-rs/skills/tests/test_plugin_creator.py \
		codex-rs/skills/tests/test_skill_installer.py \
		codex-rs/vendor/bubblewrap/demos/userns-block-fd.py \
		codex-rs/vendor/bubblewrap/tests/test-seccomp.py \
		codex-rs/vendor/bubblewrap/tests/use-as-subproject/assert-correct-rpath.py \
		codex-rs/windows-sandbox-rs/sandbox_smoketests.py

CARGO_CARGOTOML=	${BUILD_WRKSRC}/Cargo.toml
CARGO_CARGOLOCK=	${BUILD_WRKSRC}/Cargo.lock
CARGO_BUILD_ARGS=	--bin ${PORTNAME} \
			--bin ${PORTNAME}-code-mode-host \
			--bin ${PORTNAME}-responses-api-proxy \
			--bin logs_client
CARGO_TEST_ARGS=	--all-features --no-fail-fast
CARGO_ENV=		OPENSSL_NO_VENDOR=1 \
			CARGO_PROFILE_RELEASE_CODEGEN_UNITS=16 \
			CARGO_PROFILE_RELEASE_LTO=false \
			V8_FROM_SOURCE=1 \
			GN=${LOCALBASE}/bin/gn \
			EXTRA_GN_ARGS="enable_pkeys=false use_allocator_shim=false" \
			NINJA=${NINJA_CMD} \
			CLANG_BASE_PATH=${LLVM_PREFIX}

# Reference the real tools under ${LLVM_PREFIX}/bin rather than the
# ${LOCALBASE}/bin/<tool><ver> multi-call wrapper, which dispatches on $0 and
# cannot be reached through an alias under a different name.
BINARY_ALIAS=	python3=${PYTHON_CMD} \
		cpp=${LLVM_PREFIX}/bin/clang-cpp \
		cc=${LLVM_PREFIX}/bin/clang \
		c++=${LLVM_PREFIX}/bin/clang++ \
		ar=${LLVM_PREFIX}/bin/llvm-ar \
		nm=${LLVM_PREFIX}/bin/llvm-nm \
		ld=${LLVM_PREFIX}/bin/ld.lld \
		readelf=${LLVM_PREFIX}/bin/llvm-readelf

BUILD_WRKSRC=	${WRKSRC}/codex-rs

PLIST_FILES=	bin/${PORTNAME} \
		bin/${PORTNAME}-code-mode-host \
		bin/${PORTNAME}-responses-api-proxy \
		bin/logs_client
PORTDOCS=	README.md config.md

OPTIONS_DEFINE=		COMPLETIONS DOCS
OPTIONS_DEFAULT=	COMPLETIONS

COMPLETIONS_DESC=	Build and/or install shell completions

COMPLETIONS_PLIST_FILES=etc/bash_completion.d/${PORTNAME} \
			share/fish/completions/${PORTNAME}.fish \
			share/zsh/site-functions/_${PORTNAME}

.if defined(MAGUS)
MAKE_JOBS_UNSAFE=	yes
.endif

post-extract:
	@${MKDIR} ${WRKSRC_crate_v8}/third_party/icu/common
	@${CP} ${WRKSRC_crate_deno_core_icudata}/src/icudtl.dat \
		${WRKSRC_crate_v8}/third_party/icu/common

post-patch:
	@${REINPLACE_CMD} -e 's|/bin/bash|${LOCALBASE}&|' \
		${BUILD_WRKSRC}/cli/src/debug_sandbox/pid_tracker.rs \
		${BUILD_WRKSRC}/core/src/command_canonicalization.rs \
		${BUILD_WRKSRC}/core/src/command_canonicalization_tests.rs \
		${BUILD_WRKSRC}/core/src/context/world_state/environment_render_tests.rs \
		${BUILD_WRKSRC}/core/src/exec_policy.rs \
		${BUILD_WRKSRC}/core/src/exec_policy_tests.rs \
		${BUILD_WRKSRC}/core/src/exec_tests.rs \
		${BUILD_WRKSRC}/core/src/shell_snapshot_tests.rs \
		${BUILD_WRKSRC}/core/src/shell_tests.rs \
		${BUILD_WRKSRC}/core/src/tasks/user_shell_tests.rs \
		${BUILD_WRKSRC}/core/src/tools/handlers/shell_tests.rs \
		${BUILD_WRKSRC}/core/src/tools/handlers/unified_exec_tests.rs \
		${BUILD_WRKSRC}/core/src/tools/runtimes/mod.rs \
		${BUILD_WRKSRC}/core/src/tools/runtimes/mod_tests.rs \
		${BUILD_WRKSRC}/core/src/tools/sandboxing_tests.rs \
		${BUILD_WRKSRC}/core/tests/suite/exec.rs \
		${BUILD_WRKSRC}/core/tests/suite/guardian_review.rs \
		${BUILD_WRKSRC}/core/tests/suite/unified_exec.rs \
		${BUILD_WRKSRC}/core/tests/suite/user_notification.rs \
		${BUILD_WRKSRC}/exec-server/src/process_sandbox_tests.rs \
		${BUILD_WRKSRC}/exec-server/tests/file_system_unix.rs \
		${BUILD_WRKSRC}/shell-command/src/parse_command.rs \
		${BUILD_WRKSRC}/shell-command/src/shell_detect.rs \
		${BUILD_WRKSRC}/shell-command/src/shell_snapshot_tests.rs \
		${BUILD_WRKSRC}/shell-escalation/src/unix/escalate_server.rs \
		${BUILD_WRKSRC}/tui/src/exec_command.rs \
		${BUILD_WRKSRC}/utils/path-uri/src/tests.rs
	@${REINPLACE_CMD} -e 's|python3|${PYTHON_VERSION}|' \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/command_exec.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/hooks_list.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/session_end.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/thread_queue.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/thread_resume.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/thread_shell_command.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/turn_interrupt.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/turn_start.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/turn_start_zsh_fork.rs \
		${BUILD_WRKSRC}/config/src/config_requirements.rs \
		${BUILD_WRKSRC}/config/src/hooks_tests.rs \
		${BUILD_WRKSRC}/core-plugins/src/script_attribution.rs \
		${BUILD_WRKSRC}/core-plugins/src/script_attribution_tests.rs \
		${BUILD_WRKSRC}/core/src/command_canonicalization_tests.rs \
		${BUILD_WRKSRC}/core/src/config/config_loader_tests.rs \
		${BUILD_WRKSRC}/core/src/exec_policy.rs \
		${BUILD_WRKSRC}/core/src/exec_policy_tests.rs \
		${BUILD_WRKSRC}/core/src/mcp_tool_call_tests.rs \
		${BUILD_WRKSRC}/core/src/session/tests.rs \
		${BUILD_WRKSRC}/core/tests/suite/approvals.rs \
		${BUILD_WRKSRC}/core/tests/suite/code_mode.rs \
		${BUILD_WRKSRC}/core/tests/suite/compact.rs \
		${BUILD_WRKSRC}/core/tests/suite/compact_remote_parity.rs \
		${BUILD_WRKSRC}/core/tests/suite/exec.rs \
		${BUILD_WRKSRC}/core/tests/suite/hooks.rs \
		${BUILD_WRKSRC}/core/tests/suite/hooks_mcp.rs \
		${BUILD_WRKSRC}/core/tests/suite/network_approval.rs \
		${BUILD_WRKSRC}/core/tests/suite/openai_file_mcp.rs \
		${BUILD_WRKSRC}/core/tests/suite/subagent_notifications.rs \
		${BUILD_WRKSRC}/core/tests/suite/token_budget.rs \
		${BUILD_WRKSRC}/core/tests/suite/tool_lifecycle.rs \
		${BUILD_WRKSRC}/core/tests/suite/tools.rs \
		${BUILD_WRKSRC}/core/tests/suite/unified_exec.rs \
		${BUILD_WRKSRC}/exec-server/tests/exec_process.rs \
		${BUILD_WRKSRC}/exec/tests/suite/sandbox.rs \
		${BUILD_WRKSRC}/exec/tests/suite/seatbelt.rs \
		${BUILD_WRKSRC}/execpolicy/tests/basic.rs \
		${BUILD_WRKSRC}/ext/queue/tests/queue_service.rs \
		${BUILD_WRKSRC}/external-agent-migration/src/lib_tests.rs \
		${BUILD_WRKSRC}/hooks/src/engine/command_runner_tests.rs \
		${BUILD_WRKSRC}/hooks/src/engine/mod_tests.rs \
		${BUILD_WRKSRC}/hooks/src/events/compact.rs \
		${BUILD_WRKSRC}/hooks/src/events/post_tool_use.rs \
		${BUILD_WRKSRC}/linux-sandbox/tests/suite/landlock.rs \
		${BUILD_WRKSRC}/linux-sandbox/tests/suite/managed_proxy.rs \
		${BUILD_WRKSRC}/skills/src/invocation.rs \
		${BUILD_WRKSRC}/skills/src/invocation_tests.rs \
		${BUILD_WRKSRC}/tui/src/app/tests.rs \
		${BUILD_WRKSRC}/tui/src/chatwidget/tests/app_server.rs \
		${BUILD_WRKSRC}/tui/src/chatwidget/tests/approval_requests.rs \
		${BUILD_WRKSRC}/tui/src/chatwidget/tests/exec_flow.rs \
		${BUILD_WRKSRC}/tui/src/debug_config.rs \
		${BUILD_WRKSRC}/tui/src/exec_command.rs \
		${BUILD_WRKSRC}/tui/src/render/highlight.rs \
		${BUILD_WRKSRC}/utils/pty/src/tests.rs

post-build-COMPLETIONS-on:
	@${MKDIR} ${WRKSRC}/completions
.for sh in bash fish zsh
	${CARGO_TARGET_DIR}/*/*/${PORTNAME} completion ${sh} > \
		${WRKSRC}/completions/${PORTNAME}.${sh}
.endfor

do-install:
	@${MKDIR} ${PREFIX}/bin
.for prog in ${PLIST_FILES:Mbin/*:T}
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/${CARGO_BUILD_TARGET}/release/${prog} \
		${PREFIX}/bin
.endfor

post-install:
.for prog in ${PLIST_FILES:Mbin/*}
	@${STRIP_CMD} ${FAKE_DESTDIR}${PREFIX}/${prog}
.endfor

post-install-COMPLETIONS-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d \
		${FAKE_DESTDIR}${PREFIX}/share/fish/completions \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.bash \
		${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.fish \
		${FAKE_DESTDIR}${PREFIX}/share/fish/completions/${PORTNAME}.fish
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.zsh \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/_${PORTNAME}

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${BUILD_WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
