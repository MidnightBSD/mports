# New ports collection makefile for:	pcre
# Date created:				08 July 1998
# Whom:					dom
#
# $MidnightBSD: mports/devel/pcre/Makefile,v 1.7 2008/03/15 23:09:43 laffer1 Exp $
# $FreeBSD: ports/devel/pcre/Makefile,v 1.46 2007/08/04 11:40:49 gabor Exp $
#

PORTNAME=	pcre
PORTVERSION=	7.7
CATEGORIES=	devel
MASTER_SITES=	ftp://ftp.csx.cam.ac.uk/pub/software/programming/%SUBDIR%/ \
		ftp://ftp.fu-berlin.de/unix/misc/%SUBDIR%/ \
		ftp://ftp.tin.org/pub/libs/%SUBDIR%/
MASTER_SITE_SUBDIR=${PORTNAME}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Perl Compatible Regular Expressions library
LICENSE=	bsd3

USE_BZIP2=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--enable-utf8 --enable-unicode-properties
CONFIGURE_TARGET=--build=${MACHINE_ARCH}-portbld-freebsd6.0

.if !defined(NOPORTDOCS)
PORTDOCS=	*
.endif

.if defined(WITH_LINK_SIZE)
CONFIGURE_ARGS+=--with-link-size=${WITH_LINK_SIZE}
.endif

MAN1=		pcre-config.1 pcregrep.1 pcretest.1
MAN3=		pcre.3 pcre_compile.3 pcre_compile2.3 pcre_config.3 \
		pcre_copy_named_substring.3 pcre_copy_substring.3 \
		pcre_dfa_exec.3 pcre_exec.3 pcre_free_substring.3 \
		pcre_free_substring_list.3 pcre_fullinfo.3 \
		pcre_get_named_substring.3 pcre_get_stringnumber.3 \
		pcre_get_stringtable_entries.3 pcre_get_substring.3 \
		pcre_get_substring_list.3 pcre_info.3 \
		pcre_maketables.3 pcrepartial.3 pcreprecompile.3 pcre_refcount.3 \
		pcre_study.3 pcre_version.3 pcreapi.3 \
		pcrebuild.3 pcrecallout.3 pcrecompat.3 \
		pcrecpp.3 pcrematching.3 pcrepattern.3 \
		pcreperform.3 pcreposix.3 pcresample.3 pcrestack.3 \
		pcresyntax.3

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/pcregrep ${PREFIX}/bin/pcretest
.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR} ${DOCSDIR}/html
	@cd ${WRKSRC}; ${INSTALL_DATA} ChangeLog NEWS LICENCE doc/*.txt ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/doc/html/*.html ${DOCSDIR}/html
.endif

.include <bsd.port.mk>
