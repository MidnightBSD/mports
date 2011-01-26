# $MidnightBSD: mports/sysutils/memtest/Makefile,v 1.2 2009/12/28 23:06:41 laffer1 Exp $

PORTNAME=	memtest
PORTVERSION=	4.2.0
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
	@${MV} ${WRKSRC}/${PORTNAME}er.8 ${WRKSRC}/${MAN8}
	@${REINPLACE_CMD} -e 's|${PORTNAME}er |${PORTNAME} |g' \
			  -e 's| ${PORTNAME}er| ${PORTNAME}|' \
			  -e "s|${PORTNAME}er's|${PORTNAME}'s|" \
		${WRKSRC}/${MAN8}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME}er ${PREFIX}/bin/${PORTNAME}
	@${INSTALL_MAN} ${WRKSRC}/${MAN8} ${PREFIX}/man/man8/${MAN8}

.include <bsd.port.mk>
