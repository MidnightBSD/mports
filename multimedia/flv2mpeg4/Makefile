# New ports collection makefile for:   flv2mpeg4
# Date created:			October 8, 2008
# Whom:				Lucas Holt
#
# $MidnightBSD$
# $FreeBSD: ports/multimedia/flv2mpeg4/Makefile,v 1.1 2007/09/24 21:36:23 edwin Exp $
#

PORTNAME=	flv2mpeg4
DISTVERSION=	20061129
CATEGORIES=	multimedia
MASTER_SITES=	http://src4.narod.ru/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Fast and less lossy FLV to MPEG4(AVI/MOV/MP4/MP3/3GP) converter

LICENSE=	lgpl

LIB_DEPENDS=	avformat:${PORTSDIR}/multimedia/ffmpeg

USES=		tar:bzip2

MAKEFILE=	${FILESDIR}/Makefile.bsd

PLIST_FILES=	bin/flv2mpeg4

WRKSRC=		${WRKDIR}/${PORTNAME}/src

SVNROOT=	https://vixynet.svn.sourceforge.net/svnroot/vixynet

gen-dist:
	@if [ ! -f ${LOCALBASE}/bin/svn ]; then \
		${ECHO_CMD}	"ERROR: You need to install devel/subversion for gen-dist target"; \
		${FALSE}; \
	fi
	@if [ ! -f ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ]; then \
		${MKDIR} ${WRKDIR}/svn; \
		cd ${WRKDIR}/svn &&	svn co ${SVNROOT} vixynet; \
		cd ${WRKDIR}/svn/vixynet/trunk && \
		${TAR} cfj ${_DISTDIR}${DISTFILES} flv2mpeg4; \
		cd ${WRKDIR} && ${RM} -rf svn; \
		cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} makesum; \
	fi

.include <bsd.port.mk>
