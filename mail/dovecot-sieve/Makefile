# $MidnightBSD: mports/mail/dovecot-sieve/Makefile,v 1.2 2010/01/06 03:08:49 laffer1 Exp $

PORTNAME=	dovecot-sieve
PORTVERSION=	${DOVECOTVERSION}+${DISTVERSION}
DISTVERSION=	0.1.15
CATEGORIES=	mail
MASTER_SITES=	http://www.rename-it.nl/dovecot/${DOVECOTVERSION}/
DISTNAME=	${PORTNAME:C/-/-${DOVECOTVERSION}-/}-${DISTVERSIONPREFIX}${DISTVERSION:C/:(.)/\1/g}${DISTVERSIONSUFFIX}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	A Sieve plugin for the Dovecot 'deliver' LDA
LICENSE=	agg

BUILD_DEPENDS=	${NONEXISTENT}:${PORTSDIR}/mail/dovecot:build
RUN_DEPENDS=	dovecot>=${DOVECOTVERSION}.*:${PORTSDIR}/mail/dovecot

DOVECOTVERSION=	1.2

USE_LDCONFIG=	${PREFIX}/lib/dovecot/lda

MAN1=	sieve-test.1 sievec.1 sieved.1

GNU_CONFIGURE=	yes
CONFIGURE_TARGET=	--build=${MACHINE_ARCH}-portbld-freebsd${OSREL}
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-dovecot=`${MAKE} -C ${PORTSDIR}/mail/dovecot -V WRKSRC`
SUB_FILES=	pkg-message

.if !defined(NOPORTDOCS)
PORTDOCS=	AUTHORS COPYING COPYING.LGPL INSTALL NEWS README TODO
.endif

post-install:
.if !defined(NOPORTDOCS)
	${INSTALL} ${_SHROWNGRP} -m ${BINMODE} -d ${DOCSDIR}
.for f in ${PORTDOCS}
	${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.endif

.include <bsd.port.mk>
