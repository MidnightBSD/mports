# $MidnightBSD: mports/sysutils/memtest/Makefile,v 1.1 2006/10/28 05:33:42 laffer1 Exp $

PORTNAME=	memtest
PORTVERSION=	4.0.8
CATEGORIES=	sysutils
MASTER_SITES=	http://pyropus.ca/software/${PORTNAME}er/old-versions/
DISTNAME=	${PORTNAME}er-${PORTVERSION}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility to test for faulty memory subsystem
LICENSE=	gpl2

MAN8=		${PORTNAME}.8
PLIST_FILES=	bin/memtest

post-patch:
	@${REINPLACE_CMD} -e 's|cc|${CC}|' \
		${WRKSRC}/conf-cc

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}er ${PREFIX}/bin/${PORTNAME}
	@${INSTALL_MAN} ${WRKSRC}/${MAN8:S/./er./g} ${PREFIX}/man/man8/${MAN8}

.include <bsd.port.mk>
