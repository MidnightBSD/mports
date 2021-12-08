# Created by: Kazuo Kuroi <kazuok@projectkitsune.com>

PORTNAME=		xnedit
DISTVERSION=		1.3.3
CATEGORIES=		editors
MASTER_SITES=		https://sourceforge.net/projects/xnedit/files/:sourceforge
DISTFILES=		xnedit-1.3.3.tar.gz:sourceforge

MAINTAINER=		kazuok@projectkitsune.com
COMMENT=		Enhanced nedit with utf-8 support

LICENSE=		gpl2

LIB_DEPENDS=		libpcre.so:devel/pcre

USES=			motif pkgconfig

USES_XORG=		x11 xt xext

WRKSRC=			${WRKDIR}/xnedit

FAKE_MAKEARGS+=		freebsd -DPREFIX=${FAKE_DESTDIR}${TRUE_PREFIX}

post-patch:
	${REINPLACE_CMD} -e "s|PREFIX=/usr|PREFIX=${PREFIX}|g" ${WRKSRC}/Makefile 
	${REINPLACE_CMD} -e 's|$$(PREFIX)|$$(DESTDIR)$$(PREFIX)|g' ${WRKSRC}/Makefile

post-fake:
	${REINPLACE_CMD} -e "s|${FAKE_DESTDIR}||g" ${FAKE_DESTDIR}${PREFIX}/share/applications/xnedit.desktop

.include <bsd.port.mk>
