# New ports collection makefile for:	php5-ftp
# Date created:			7 Jul 2004
# Whom:				Alex Dupre <ale@FreeBSD.org>
#
# $MidnightBSD$
# $FreeBSD: ports/ftp/php5-ftp/Makefile,v 1.1 2004/07/19 09:09:14 ale Exp $
#

CATEGORIES=	ftp

MASTERDIR=	${.CURDIR}/../../lang/php5

PKGNAMESUFFIX=	-ftp

post-patch:
	@${REINPLACE_CMD} s/HAVE_OPENSSL_EXT/__FreeBSD__/ \
		${WRKSRC}/ftp.* ${WRKSRC}/php_ftp.*

.include "${MASTERDIR}/Makefile"
