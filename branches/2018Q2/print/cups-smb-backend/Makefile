# Created by: Andrew Pantyukhin <infofarmer@FreeBSD.org>
# $FreeBSD: head/print/cups-smb-backend/Makefile 410825 2016-03-11 11:53:42Z tijl $
# $MidnightBSD$

PORTNAME=	cups-smb-backend
PORTVERSION=	1.0
PORTREVISION=	2
CATEGORIES=	print
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	CUPS backend for printing to Windows servers

LICENSE=	unknown

RUN_DEPENDS=	${LOCALBASE}/sbin/cupsd:print/cups

USES=		samba:run # smbspool
NO_BUILD=	yes
PLIST_FILES=	libexec/cups/backend/smb
SUB_FILES=	pkg-message

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/libexec/cups/backend
	${LN} -fs ${PREFIX}/bin/smbspool ${STAGEDIR}${PREFIX}/libexec/cups/backend/smb

.include <bsd.port.mk>
