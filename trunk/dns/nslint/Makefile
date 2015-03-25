# $MidnightBSD$

PORTNAME=	nslint
PORTVERSION=	3.1
PORTREVISION=	1
CATEGORIES=	dns
MASTER_SITES=	ftp://ftp.ee.lbl.gov/ \
		FREEBSD_LOCAL/ehaupt
DISTNAME=	${PORTNAME}-${PORTVERSION:S/.a/a/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perform consistency checks on DNS zone files

LICENSE=	bsd4
#not exactly, but it contains the advertising clause.

GNU_CONFIGURE=	yes

ALL_TARGET=	${PORTNAME}
INSTALL_TARGET=	install

BOOTFILE?=	/etc/namedb/named.boot
CONFFILE?=	/etc/namedb/named.conf

PLIST_FILES=	bin/nslint man/man8/nslint.8.gz

post-patch:
	@${REINPLACE_CMD} -e '/^\ \{4\}V_CCOPT/d' ${WRKSRC}/configure
	@@${REINPLACE_CMD} -e 's|/etc/named.boot|${BOOTFILE}|; \
		s|/etc/named.conf|${CONFFILE}|' \
			${WRKSRC}/${PORTNAME}.c \
			${WRKSRC}/${PORTNAME}.8

.include <bsd.port.mk>
