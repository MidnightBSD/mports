PORTNAME=	codex
DISTVERSIONPREFIX=	rust-v
DISTVERSION=	0.114.0
CATEGORIES=	misc devel

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight coding agent that runs in your terminal
WWW=		https://openai.com/codex \
		https://github.com/openai/codex

LICENSE=	Apache-2.0
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libzstd.so:archivers/zstd \
		libdbus-1.so:devel/dbus \
		libonig.so:devel/oniguruma
RUN_DEPENDS=	bash:shells/bash \
		rg:textproc/ripgrep
TEST_DEPENDS=	bash:shells/bash

USES=		cargo python:test shebangfix ssl

USE_GITHUB=	yes
GH_ACCOUNT=	openai

SHEBANG_FILES=	codex-rs/skills/src/assets/samples/skill-creator/scripts/generate_openai_yaml.py \
		codex-rs/skills/src/assets/samples/skill-creator/scripts/init_skill.py \
		codex-rs/skills/src/assets/samples/skill-creator/scripts/quick_validate.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/github_utils.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/install-skill-from-github.py \
		codex-rs/skills/src/assets/samples/skill-installer/scripts/list-skills.py

CARGO_CARGOTOML=	${BUILD_WRKSRC}/Cargo.toml
CARGO_CARGOLOCK=	${BUILD_WRKSRC}/Cargo.lock
CARGO_BUILD_ARGS=	--bin ${PORTNAME}
CARGO_INSTALL_PATH=	codex-rs
CARGO_TEST_ARGS=	--all-features --no-fail-fast
CARGO_ENV=		OPENSSL_NO_VENDOR=1

BUILD_WRKSRC=	${WRKSRC}/codex-rs

PLIST_FILES=	bin/${PORTNAME}
PORTDOCS=	README.md config.md

OPTIONS_DEFINE=		COMPLETIONS DOCS
OPTIONS_DEFAULT=	COMPLETIONS

COMPLETIONS_DESC=	Build and/or install shell completions

COMPLETIONS_PLIST_FILES=etc/bash_completion.d/${PORTNAME} \
			share/fish/completions/${PORTNAME}.fish \
			share/zsh/site-functions/_${PORTNAME}

post-patch:
	@${REINPLACE_CMD} -e \
		's|ssh://git@github.com/openai-oss-forks/tungstenite-rs.git|https://github.com/openai-oss-forks/tungstenite-rs|' \
		${BUILD_WRKSRC}/Cargo.toml
	@${REINPLACE_CMD} -e 's|/bin/bash|${LOCALBASE}&|' \
		${BUILD_WRKSRC}/cli/src/debug_sandbox/pid_tracker.rs \
		${BUILD_WRKSRC}/core/src/command_canonicalization.rs \
		${BUILD_WRKSRC}/core/src/environment_context.rs \
		${BUILD_WRKSRC}/core/src/exec.rs \
		${BUILD_WRKSRC}/core/src/exec_policy.rs \
		${BUILD_WRKSRC}/core/src/shell.rs \
		${BUILD_WRKSRC}/core/src/shell_snapshot.rs \
		${BUILD_WRKSRC}/core/src/tools/handlers/shell.rs \
		${BUILD_WRKSRC}/core/src/tools/handlers/unified_exec.rs \
		${BUILD_WRKSRC}/core/src/tools/runtimes/mod.rs \
		${BUILD_WRKSRC}/core/tests/suite/exec.rs \
		${BUILD_WRKSRC}/core/tests/suite/unified_exec.rs \
		${BUILD_WRKSRC}/core/tests/suite/user_notification.rs \
		${BUILD_WRKSRC}/shell-command/src/parse_command.rs \
		${BUILD_WRKSRC}/shell-escalation/src/unix/escalate_server.rs \
		${BUILD_WRKSRC}/tui/src/exec_command.rs
	@${REINPLACE_CMD} -e 's|python3\([^_]\)|${PYTHON_VERSION}\1|g' \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/thread_resume.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/turn_start.rs \
		${BUILD_WRKSRC}/app-server/tests/suite/v2/turn_start_zsh_fork.rs \
		${BUILD_WRKSRC}/core/src/command_canonicalization.rs \
		${BUILD_WRKSRC}/core/src/exec_policy.rs \
		${BUILD_WRKSRC}/core/src/seatbelt.rs \
		${BUILD_WRKSRC}/core/src/skills/invocation_utils.rs \
		${BUILD_WRKSRC}/core/tests/suite/approvals.rs \
		${BUILD_WRKSRC}/core/tests/suite/seatbelt.rs \
		${BUILD_WRKSRC}/core/tests/suite/tools.rs \
		${BUILD_WRKSRC}/core/tests/suite/unified_exec.rs \
		${BUILD_WRKSRC}/exec/tests/suite/sandbox.rs \
		${BUILD_WRKSRC}/execpolicy/tests/basic.rs \
		${BUILD_WRKSRC}/linux-sandbox/tests/suite/managed_proxy.rs \
		${BUILD_WRKSRC}/shell-command/src/bash.rs \
		${BUILD_WRKSRC}/shell-command/src/command_safety/is_safe_command.rs \
		${BUILD_WRKSRC}/shell-command/src/parse_command.rs \
		${BUILD_WRKSRC}/tui/src/render/highlight.rs \
		${BUILD_WRKSRC}/utils/pty/src/tests.rs

post-build-COMPLETIONS-on:
	@${MKDIR} ${WRKSRC}/completions
.for sh in bash fish zsh
	${CARGO_TARGET_DIR}/*/*/${PORTNAME} completion ${sh} > \
		${WRKSRC}/completions/${PORTNAME}.${sh}
.endfor

do-install:
	${INSTALL_PROGRAM} ${CARGO_TARGET_DIR}/*/*/${PORTNAME} \
		${PREFIX}/bin

do-install-COMPLETIONS-on:
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d \
		${FAKE_DESTDIR}${PREFIX}/share/fish/completions \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.bash \
		${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d/${PORTNAME}
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.fish \
		${FAKE_DESTDIR}${PREFIX}/share/fish/completions/${PORTNAME}.fish
	${INSTALL_DATA} ${WRKSRC}/completions/${PORTNAME}.zsh \
		${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/_${PORTNAME}

do-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_MAN} ${PORTDOCS:S|^|${BUILD_WRKSRC}/|} ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
