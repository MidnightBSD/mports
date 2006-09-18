# New ports collection makefile for:	tcshrc
# Date created:		2003-09-09
# Whom:			Sean Chittenden <seanc@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/shells/tcshrc/Makefile,v 1.4 2006/05/13 04:15:22 edwin Exp $
#

PORTNAME=	tcshrc
PORTVERSION=	1.6.0
CATEGORIES=	shells
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE}
MASTER_SITE_SUBDIR=	tcshrc

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A set of configuration scripts for the TCSH shell

INSTALL_TARGET=	systeminstall
MAKE_ARGS=	BIN=${LOCALBASE}/bin SHARETCSHRC=${DATADIR}

WRKSRC=	${WRKDIR}/${PORTNAME}-${PORTVERSION}

do-build:
	${REINPLACE_CMD} -e 's#/usr/share#${PREFIX}/share#g' ${WRKSRC}/tcshrc_config

.include <bsd.port.mk>
