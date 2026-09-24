PORTNAME=	blackbox
PORTVERSION=	0.77
CATEGORIES=	x11-wm
MASTER_SITES=	https://github.com/bbidulock/blackboxwm/releases/download/${PORTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Small and fast window manager for X11R6
WWW=		https://github.com/bbidulock/blackboxwm

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		gettext libtool localbase:ldflags pathfix pkgconfig iconv tar:lz \
		xorg
USE_CXXSTD=	c++14
USE_XORG=	x11 xext xft

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--with-libiconv-prefix=${ICONV_PREFIX} \
		--with-libintl-prefix=${LOCALBASE}
LDFLAGS+=	${ICONV_LIB}

PORTDOCS=	README
MANPAGES=	bsetbg.1 bsetroot.1

OPTIONS_DEFINE=	TOOLS_ONLY DOCS

TOOLS_ONLY_DESC=	Do not install window manager, only tools

TOOLS_ONLY_MAKE_ARGS=		SUBDIRS="lib util" bin_PROGRAMS=bsetroot
TOOLS_ONLY_INSTALL_TARGET=	-C util install # XXX dirty hack :(
TOOLS_ONLY_VARS=		PKGNAMESUFFIX=-tools \
				COMMENT+="(tools only)"
TOOLS_ONLY_VARS_OFF=		PORTDOCS+="AUTHORS COMPLIANCE ChangeLog NEWS TODO"

.include <bsd.mport.options.mk>

.if ${ARCH} == armv6 || ${ARCH} == armv7
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-src_Toolbar.cc
.endif

post-patch:
	@${REINPLACE_CMD} -e '1s|^#!/bin/bash|#!/bin/sh|' ${WRKSRC}/util/bsetbg

post-install:
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S#^#${WRKSRC}/#} ${DOCSDIR}

post-install-TOOLS_ONLY-on:
	@${REINPLACE_CMD} -E '/[^s]\/blackbox|bstyleconvert|lib|include|share\/locale|share\/man\/[a-z][a-z](\/|$$)/d' \
		${TMPPLIST}
	${INSTALL_MAN} ${MANPAGES:S#^#${WRKSRC}/doc/#} ${FAKE_DESTDIR}${PREFIX}/share/man/man1

.include <bsd.port.mk>
