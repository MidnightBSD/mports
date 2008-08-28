# New ports collection makefile for:	thttpd-st
# Date created:		2005-09-21
# Whom:			Alexander Novitsky <alecn2002@yandex.ru>
#
# $MidnightBSD$
# $FreeBSD: ports/www/thttpd-st/Makefile,v 1.1 2005/11/22 13:29:07 edwin Exp $
#

PKGNAMESUFFIX=-st

PATCH_SITES=	file://${.CURDIR}/files/
PATCHFILES=	st-patch-fdwatch.c st-patch-thttpd.c st-patch-Makefile.in

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tiny/turbo/throttling HTTP server with State Threads

BUILD_DEPENDS=	${LOCALBASE}/lib/libst.so.1:${PORTSDIR}/devel/st
LIB_DEPENDS=	st.1:${PORTSDIR}/devel/st

MD5_FILE=	${.CURDIR}/distinfo

MASTERDIR=	${.CURDIR}/../../www/thttpd
.include "${MASTERDIR}/Makefile"
