# New ports collection makefile for:	perl5
# Date created:		16 April 1995
# Whom:			markm
#
# $MidnightBSD: mports/lang/perl5.8/Makefile,v 1.14 2009/04/05 20:01:40 laffer1 Exp $
# $FreeBSD: ports/lang/perl5.8/Makefile,v 1.89 2006/08/04 12:34:44 erwin Exp $
#

PORTNAME=	perl
PORTVERSION=	5.8.9
CATEGORIES=	lang devel perl5
MASTER_SITES=	CPAN \
		${MASTER_SITE_FREEBSD_LOCAL:S/$/:local/} \
		http://protey.ru/freebsd/distfiles/:local
MASTER_SITE_SUBDIR=	../../src \
			skv/:local
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} \
		BSDPAN-${PERL_VER}${EXTRACT_SUFX}:local

PATCH_SITES=	${MASTER_SITE_FREEBSD_LOCAL:S!$!skv/!} \
		http://protey.ru/freebsd/distfiles/
PATCHFILES=	defined-or-5.8.9.bz2

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Practical Extraction and Report Language
LICENSE=	perl

PERL_VER=	${PORTVERSION}
PERL_VERSION=	${PORTVERSION}


PERL_NO_DEPENDS= 	yes
USE_PERL5=		yes


USE_BZIP2=	yes
HAS_CONFIGURE=	yes
CONFIGURE_SCRIPT=Configure
CONFIGURE_ARGS=	-sde -Dprefix=${PREFIX} \
	-Darchlib=${PREFIX}/lib/perl5/${PERL_VER}/${PERL_ARCH} \
	-Dprivlib=${PREFIX}/lib/perl5/${PERL_VER} \
	-Dman3dir=${PREFIX}/lib/perl5/${PERL_VER}/perl/man/man3 \
	-Dman1dir=${PREFIX}/man/man1 \
	-Dsitearch=${PREFIX}/${SITE_PERL_REL}/${PERL_ARCH} \
	-Dsitelib=${PREFIX}/${SITE_PERL_REL} -Dscriptdir=${PREFIX}/bin \
	-Dsiteman3dir=${PREFIX}/lib/perl5/${PERL_VER}/man/man3 \
	-Dsiteman1dir=${PREFIX}/man/man1 \
	-Ui_malloc -Ui_iconv -Uinstallusrbinperl \
	-Dcc="${CC}" -Duseshrplib \
	-Dccflags=-DAPPLLIB_EXP=\"${BSDPAN_DEST}\"
# "
	
LOCALE_CLEANUP=	LANG="" LC_ALL="" LC_COLLATE="" LC_CTYPE="" \
		LC_MESSAGES="" LC_MONETARY="" LC_NUMERIC="" \
		LC_TIME=""
CONFIGURE_ENV+=	${LOCALE_CLEANUP}
MAKE_ENV+=	${LOCALE_CLEANUP}
USE_LDCONFIG=	yes

OPTIONS = DEBUGGING "Enable debugging support" Off \
	  GDBM "Build GDBM_File extension" Off \
	  PERL_MALLOC "Use Perl's malloc" On \
	  PERL_64BITINT "Use 64 bit integers" On \
	  THREADS "Enable thread support" Off \
	  SUIDPERL "Also build set-user-id suidperl binary" Off


.include "Makefile.man"
.include <bsd.port.pre.mk>

.if defined(WITH_DEBUGGING)
CONFIGURE_ARGS+=	-Doptimize="-g" -DDEBUGGING
STRIP=
STRIP_CMD=	${TRUE}
.else
CONFIGURE_ARGS+=	-Doptimize="${CFLAGS}"
.endif

.if defined(WITH_SUIDPERL)
CONFIGURE_ARGS+=	-Dd_dosuid=define
PLIST_SUB+=		SUIDPERL=""
.else
CONFIGURE_ARGS+=	-Ud_dosuid
PLIST_SUB+=		SUIDPERL="@comment "
.endif

.if defined(WITH_GDBM)
CONFIGURE_ARGS+=	-Di_gdbm
LIB_DEPENDS+=		gdbm.3:${PORTSDIR}/databases/gdbm
PLIST_SUB+=		GDBM=""
.else
CONFIGURE_ARGS+=	-Ui_gdbm
PLIST_SUB+=		GDBM="@comment "
.endif


.if defined(WITH_THREADS)
#XXX .if ${ARCH} == "amd64"
#XXX IGNORE=	Threaded perl does not pass tests on ${ARCH}
#XXX .endif
CONFIGURE_ARGS+=	-Dusethreads=y
PKGNAMESUFFIX=		-threaded
# it seems perl malloc has problems with threaded perl on FreeBSD
.undef WITH_PERL_MALLOC
.else
CONFIGURE_ARGS+=	-Dusethreads=n
.endif

.if defined(WITH_PERL_MALLOC)
CONFIGURE_ARGS+=	-Dusemymalloc=y
.else
CONFIGURE_ARGS+=	-Dusemymalloc=n
.endif

.if !defined(WITHOUT_PERL_64BITINT)
CONFIGURE_ARGS+=	-Duse64bitint
.endif

LATEST_LINK=	perl

.if defined(WITH_GDBM)
MAN3+=	GDBM_File.3
.endif

MAN3PREFIX=	${TARGETDIR}/lib/perl5/${PERL_VER}/perl

BSDPAN_DEST=	${PREFIX}/lib/perl5/${PERL_VER}/BSDPAN
BSDPAN_FILES=	BSDPAN.pm BSDPAN/Override.pm Config.pm \
		ExtUtils/MM_Unix.pm \
		ExtUtils/MakeMaker.pm \
		ExtUtils/Packlist.pm
BSDPAN_WRKSRC=	${WRKDIR}/BSDPAN-${PORTVERSION}


post-patch:
	${SED} -e 's|%%PREFIX%%|${PREFIX}|g;' \
	-e 's|%%PERL_VER%%|${PERL_VER}|g;' \
	-e 's|%%PERL_VERSION%%|${PERL_VERSION}|g;' \
	-e 's|%%PERL_ARCH%%|${PERL_ARCH}|g;' \
	-e 's|%%MAKE_CONF%%|${__MAKE_CONF}|g;' \
	${FILESDIR}/pkg-glue > ${WRKDIR}/pkg-glue
	${SED} -e 's|%%PERL%%|${PERL}|g;' \
		${FILESDIR}/perl-after-upgrade \
		> ${WRKDIR}/perl-after-upgrade

.if defined(WITH_THREADS)
	${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%|${PTHREAD_LIBS}|g;' \
		-e 's|%%PTHREAD_CFLAGS%%|${PTHREAD_CFLAGS}|g;' \
		${WRKSRC}/hints/freebsd.sh
.else
	${REINPLACE_CMD} -e 's|%%PTHREAD_LIBS%%||g;' \
		-e 's|%%PTHREAD_CFLAGS%%||g;' \
		${WRKSRC}/hints/freebsd.sh
.endif

PKGINSTALL=${WRKDIR}/pkg-glue
PKGDEINSTALL=${WRKDIR}/pkg-glue

pre-install:
	@${RM} -f ${PREFIX}/bin/perl${PERL_VER}
	@${RM} -f ${PREFIX}/bin/perl

post-install:
	@${STRIP_CMD} ${PREFIX}/bin/perl${PERL_VER}
	@${STRIP_CMD} ${PREFIX}/bin/perl
	@${SETENV} LD_LIBRARY_PATH=${WRKSRC} ${PREFIX}/bin/perl -I${WRKSRC}/lib \
		${PREFIX}/bin/pod2man ${WRKDIR}/perl-after-upgrade >${WRKDIR}/perl-after-upgrade.1
	@${INSTALL_SCRIPT} ${WRKDIR}/perl-after-upgrade ${PREFIX}/bin/perl-after-upgrade
	@${INSTALL_MAN} ${WRKDIR}/perl-after-upgrade.1 ${MAN1PREFIX}/man/man1/perl-after-upgrade.1
	@${LN} -sf ${PREFIX}/lib/perl5/${PERL_VER}/mach/CORE/libperl.so ${PREFIX}/lib/libperl.so
	@${LN} -sf ${PREFIX}/bin/perl${PERL_VER} ${PREFIX}/bin/perl5
.for files in ${BSDPAN_FILES}
	${MKDIR} ${BSDPAN_DEST}/${files:H}
	${INSTALL} ${COPY} -o ${BINOWN} -g ${BINGRP} -m ${NOBINMODE} \
		${BSDPAN_WRKSRC}/${files} ${BSDPAN_DEST}/${files}
.endfor

test:
	@cd ${WRKSRC} && ${MAKE} test
	
rebuild-xs:
	${LOCALBASE}/sbin/portupgrade -f `(${FIND} ${PKG_DBDIR}/p5*/+CONTENTS | \
		${XARGS} ${GREP} -El 'site_perl.*\.so' | \
		${SED} -e 's!/var/db/pkg/!!; s!/+CONTENTS!!;')`

.include <bsd.port.post.mk>
