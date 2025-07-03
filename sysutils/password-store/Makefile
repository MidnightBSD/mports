PORTNAME=	password-store
PORTVERSION=	1.7.4
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	https://git.zx2c4.com/${PORTNAME}/snapshot/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Stores, retrieves, generates, and synchronizes passwords securely
WWW=		https://www.passwordstore.org/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

RUN_DEPENDS=	bash:shells/bash \
		getopt>=0:misc/getopt \
		gnupg>=2:security/gnupg \
		tree>=1.7:sysutils/tree

USES=		tar:xz

NO_ARCH=	yes
NO_BUILD=	yes

OPTIONS_DEFINE=		CONTRIB EXAMPLES GIT XCLIP WAYLAND QRENCODE
OPTIONS_DEFAULT=	CONTRIB XCLIP
OPTIONS_SUB=		yes

GIT_DESC=		Enable git storage
XCLIP_DESC=		Enable xclip feature
WAYLAND_DESC=		Enable wl-clipboard support
CONTRIB_DESC=		Include shell completions, import scripts, related projects
QRENCODE_DESC=		Enable QR code support

GIT_RUN_DEPENDS=	git>=0:devel/git
XCLIP_RUN_DEPENDS=	xclip>=0:x11/xclip
CONTRIB_RUN_DEPENDS=	pwgen>=0:sysutils/pwgen
QRENCODE_RUN_DEPENDS=	libqrencode>=0:graphics/libqrencode
WAYLAND_RUN_DEPENDS=	wl-clipboard>=0:x11/wl-clipboard

SUB_FILES=		pass

.include <bsd.mport.options.mk>

post-patch:
	@${REINPLACE_CMD} -Ee 's|/usr/local|${LOCALBASE}|g' ${WRKSRC}/src/platform/freebsd.sh
	@${REINPLACE_CMD} -Ee 's|^SYSTEM_EXTENSION_DIR=""|SYSTEM_EXTENSION_DIR="${PREFIX}/libexec/${PORTNAME}/extensions"|g' \
		${WRKSRC}/src/${PORTNAME}.sh

do-install:
	${INSTALL_SCRIPT} ${WRKDIR}/pass ${PREFIX}/bin/
	${MKDIR} ${PREFIX}/libexec/${PORTNAME}/extensions
	${MKDIR} ${PREFIX}/libexec/${PORTNAME}/platform
	${INSTALL_SCRIPT} ${WRKSRC}/src/${PORTNAME}.sh ${PREFIX}/libexec/${PORTNAME}/pass
	${INSTALL_SCRIPT} ${WRKSRC}/src/platform/freebsd.sh ${PREFIX}/libexec/${PORTNAME}/platform/
	${INSTALL_MAN} ${WRKSRC}/man/pass.1 ${PREFIX}/share/man/man1/pass.1

do-install-CONTRIB-on:
	@${RM} ${WRKSRC}/contrib/emacs/.gitignore
	@${MKDIR} ${FAKE_DESTDIR}${DATADIR}
	(cd ${WRKSRC}/contrib && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DATADIR})
	(cd ${WRKSRC}/src/completion && ${COPYTREE_SHARE} . ${FAKE_DESTDIR}${DATADIR})
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions
	${INSTALL_DATA} ${FAKE_DESTDIR}${DATADIR}/pass.zsh-completion ${FAKE_DESTDIR}${PREFIX}/share/zsh/site-functions/_pass
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d
	${INSTALL_DATA} ${FAKE_DESTDIR}${DATADIR}/pass.bash-completion ${FAKE_DESTDIR}${PREFIX}/etc/bash_completion.d/${PORTNAME}
	@${MKDIR} ${FAKE_DESTDIR}${PREFIX}/share/fish/completions
	${INSTALL_DATA} ${FAKE_DESTDIR}${DATADIR}/pass.fish-completion ${FAKE_DESTDIR}${PREFIX}/share/fish/completions/${PORTNAME}.fish

do-install-EXAMPLES-on:
	@${MKDIR} ${FAKE_DESTDIR}${EXAMPLESDIR}
	${INSTALL_SCRIPT} ${WRKSRC}/man/example-filter.sh ${FAKE_DESTDIR}${EXAMPLESDIR}

.include <bsd.port.mk>
