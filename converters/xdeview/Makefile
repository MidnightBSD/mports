PORTNAME=	xdeview
PORTVERSION=	0.5.20
CATEGORIES=	converters tcl tk
MASTER_SITES=	http://www.fpx.de/fp/Software/UUDeview/download/
DISTNAME=	uudeview-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	X11 program for uu/xx/Base64/BinHex/yEnc de-/encoding
WWW=		http://www.fpx.de/fp/Software/UUDeview/

LICENSE=	gpl2+
LICENSE_FILE=	${WRKSRC}/COPYING

LIB_DEPENDS=	libuu.so:converters/uulib

USES=		desthack localbase:ldflags tk

GNU_CONFIGURE=	yes
# Explicitly disable Tcl otherwise the configure script picks-up
# crud from the $PATH like /usr/opt/Simili/tcl/.
CONFIGURE_ARGS=	--disable-tcl --disable-tk
ALL_TARGET=	xdeview
INSTALL_TARGET=	install-tcl

CPPFLAGS+=	-I${TCL_INCLUDEDIR} -DHAVE_TCL \
		-I${TK_INCLUDEDIR} -DHAVE_TK
LDFLAGS+=	-lX11 -ltcl${TCL_VER:S/.//} \
		-ltk${TCL_VER:S/.//} -lm

PLIST_FILES=	bin/uuwish bin/xdeview man/man1/xdeview.1.gz
PORTDOCS=	*

OPTIONS_DEFINE=	DOCS

.include <bsd.mport.options.mk>

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/uuwish
	${INSTALL_MAN} ${WRKSRC}/man/xdeview.1 ${MANPREFIX}/man/man1

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${FILESDIR}/porting.notes ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
