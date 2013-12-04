# $MidnightBSD$

PORTNAME=	ezjail
PORTVERSION=	3.3
CATEGORIES=	sysutils
MASTER_SITES=	http://erdgeist.org/arts/software/ezjail/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Framework to easily create, manipulate, and run BSD jails

LICENSE=	other

USE_BZIP2=	yes

MAN5=		ezjail.conf.5
MAN7=		ezjail.7
MAN8=		ezjail-admin.8

post-install:
	${REINPLACE_CMD} -e 's|${FAKE_DESTDIR}||g' \
                ${PREFIX}/etc/ezjail.conf.sample \
		${PREFIX}/etc/rc.d/ezjail \
		${PREFIX}/bin/ezjail-admin
	[ -f ${PREFIX}/etc/${PORTNAME}.conf ] || \
		${CP} -p ${PREFIX}/etc/${PORTNAME}.conf.sample \
			 ${PREFIX}/etc/${PORTNAME}.conf

.include <bsd.port.mk>
