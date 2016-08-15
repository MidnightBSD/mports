# $MidnightBSD$

PORTNAME=	manedit
PORTVERSION=	1.2.1
PORTREVISION=	2
CATEGORIES=	editors
MASTER_SITES=	http://wolfsinger.com/~wolfpack/packages/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	UNIX manual page editor and viewer

LICENSE=        gpl2

WRKSRC=		${WRKDIR}/${DISTNAME}/${PORTNAME}

MAKEFILE=	Makefile.FreeBSD
USES=		tar:bzip2
USE_GNOME=	gtk12

pre-configure:
	@${CP} ${FILESDIR}/mntent* ${WRKSRC}

post-patch:
	@${REINPLACE_CMD} -e '/-o $$(BIN)/s/(CC)/(CXX)/' ${WRKSRC}/${MAKEFILE}
	@${REINPLACE_CMD} -e '/^MAN/s/.bz2//' ${WRKSRC}/Makefile.install.FreeBSD
	@${REINPLACE_CMD} -e '/^SRC_C =/s//& mntent_compat.c/' \
		${WRKSRC}/Makefile.srclist

.include <bsd.port.mk>
