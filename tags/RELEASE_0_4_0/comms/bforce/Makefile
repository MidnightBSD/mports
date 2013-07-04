# New ports collection makefile for:	bforce
# Date created:		19 Feb 2003
# Whom:			Vladimir Kurtikov <vk@vk.pp.ru>
#
# $MidnightBSD: mports/comms/bforce/Makefile,v 1.1 2008/08/17 21:32:53 laffer1 Exp $
# $FreeBSD: ports/comms/bforce/Makefile,v 1.5 2005/11/09 22:58:41 mnag Exp $
#

PORTNAME=	bforce
PORTVERSION=	0.22.8
PORTREVISION=	1
CATEGORIES=	comms
MASTER_SITES=	ftp://fido.kuzbass.ru/pub/fileecho/DALLAS.SOFT/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple ifcico like Fidonet technology mailer
LICENSE=	gpl2

USE_BZIP2=	yes
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CFLAGS+=	-fno-builtin

WRKSRC=		${WRKDIR}/${DISTNAME}/source
SUB_FILES=	pkg-message

do-install:
	${MKDIR} ${PREFIX}/etc/bforce
	${INSTALL_DATA} ${WRKSRC}/../examples/bforce.conf ${PREFIX}/etc/bforce/bforce.conf.sample
	${INSTALL_DATA} ${WRKSRC}/../examples/bforce.passwd ${PREFIX}/etc/bforce/bforce.passwd.sample
	${INSTALL_DATA} ${WRKSRC}/../examples/bforce.subst ${PREFIX}/etc/bforce/bforce.subst.sample
	${INSTALL_DATA} ${WRKSRC}/../examples/freq.aliases ${PREFIX}/etc/bforce/freq.aliases.sample
	${INSTALL_DATA} ${WRKSRC}/../examples/freq.dirs ${PREFIX}/etc/bforce/freq.dirs.sample
	${INSTALL_PROGRAM} ${WRKSRC}/bin/bforce ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/bfindex ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/bfstat ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/bin/nlookup ${PREFIX}/bin
	@${SED} "s|%%PREFIX%%|${PREFIX}|" ${PKGMESSAGE}

.include <bsd.port.mk>
