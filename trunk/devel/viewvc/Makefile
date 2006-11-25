# New ports collection makefile for:	viewcvs
# Date created:				Sun 02 Jul 2000
# Whom:					will
#
# $FreeBSD: ports/devel/viewvc/Makefile,v 1.22 2006/07/26 19:01:22 mnag Exp $
# $MidnightBSD$
#

PORTNAME=	viewvc
PORTVERSION=	1.0.1
CATEGORIES=	devel python
MASTER_SITES=	http://viewvc.tigris.org/files/documents/3330/33320/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Web-based Version Control Repository Browsing

FETCH_DEPENDS=	wget:${PORTSDIR}/ftp/wget

FETCH_CMD=	${LOCALBASE}/bin/wget -c
DISABLE_SIZE=	yes	# Need because -S are not recognized by wget

USE_PYTHON=	yes
NO_BUILD=	yes

SUB_FILES=	pkg-message
SUB_LIST=	INSTDIR="${PREFIX}/${INSTDIR}"

INSTDIR?=	${PORTNAME}
PLIST_SUB=	INSTDIR=${INSTDIR}

do-install:
	(cd ${WRKSRC} && ${PYTHON_CMD} viewvc-install --prefix=${PREFIX}/${INSTDIR} --destdir="")

post-install:
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.mk>
