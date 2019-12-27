# Created By:	Lucas Holt <luke@midnightbsd.org>

PORTNAME=	common-services
PORTVERSION=	1.5
CATEGORIES=	core
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=     luke@MidnightBSD.org
COMMENT=        MidnightBSD Common Services

LICENSE=	agg

RUN_DEPENDS=	${LOCALBASE}/sbin/named:${PORTSDIR}/dns/bind912 \
		${LOCALBASE}/sbin/sendmail:${PORTSDIR}/mail/sendmail \
		smbd:${PORTSDIR}/net/samba48 \
		cupsd:${PORTSDIR}/print/cups

NO_WRKSUBDIR=	YES
NO_BUILD=	YES

do-install:

.include <bsd.port.mk>
