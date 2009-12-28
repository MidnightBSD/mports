# $MidnightBSD: mports/shells/tcshrc/Makefile,v 1.3 2009/12/28 22:27:21 laffer1 Exp $

PORTNAME=	tcshrc
PORTVERSION=	1.6.2
CATEGORIES=	shells
MASTER_SITES=	SF

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of configuration scripts for the TCSH shell
LICENSE=	gpl2

WRKSRC=		${WRKDIR}/${PORTNAME}

NO_BUILD=	yes

INSTALL_TARGET=	systeminstall
MAKE_ARGS=	BIN=${FAKE_DESTDIR}${LOCALBASE}/bin SHARETCSHRC=${FAKE_DESTDIR}${DATADIR}

post-patch:
	@${REINPLACE_CMD} -e 's#/usr/share#${PREFIX}/share#g' \
		${WRKSRC}/tcshrc_config

.include <bsd.port.mk>
