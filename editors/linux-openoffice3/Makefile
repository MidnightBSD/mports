# New ports collection makefile for: openoffice2-linux
# Date created:		June 4 2008
# Whom:			Lucas Holt <luke@midnightbsd.org>
#
# $MidnightBSD: mports/editors/linux-openoffice3/Makefile,v 1.5 2009/08/24 20:40:25 laffer1 Exp $
#

PORTNAME=	openoffice3
PORTVERSION=	${OO_RELEASE}
PORTREVISION=	0
CATEGORIES=	editors java linux
MASTER_SITES=	${MASTER_SITE_OPENOFFICE:=stable/${OO_RELEASE}/}
PKGNAMEPREFIX?=	linux-
DISTNAME=	OOo_${OO_RELEASE}_Linux_x86_install-rpm_en-US
EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

MAINTAINER=	luke@midnightbsd.org
COMMENT=	Integrated office productivity suite (binary pkg)
LICENSE=	lgpl

RUN_DEPENDS+=	${LOCALBASE}/share/icons/hicolor/index.theme:${PORTSDIR}/misc/hicolor-icon-theme

ONLY_FOR_ARCHS=	i386 amd64

USE_GCPIO=	yes
USE_LINUX=	yes
USE_XORG=	x11 ice xaw xau xext xrender xrandr \
		xi xt xcursor xdamage xcomposite xfixes
NO_BUILD=	yes

OO_VER=		3.3
OO_RELEASE=	3.3.0
OO_BUILD=	9567

RPM2CPIO?=	${LOCALBASE}/bin/rpm2cpio
BUILD_DEPENDS+=	${RPM2CPIO}:${PORTSDIR}/archivers/rpm
RC_CMD?=			${RPM2CPIO}
RC_AFTER_ARGS?=	| ${CPIO} -id --quiet

RPMFILES= \
	ooobasis${OO_VER}-base-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-binfilter-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-calc-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core01-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core02-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core03-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core04-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core05-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core06-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-core07-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-draw-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-base-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-binfilter-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-calc-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-draw-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-help-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-impress-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-math-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-res-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-en-US-writer-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-gnome-integration-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-graphicfilter-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-images-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-impress-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-javafilter-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-kde-integration-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-math-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-onlineupdate-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-ooofonts-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-ooolinguistic-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-pyuno-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-testtool-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-writer-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	ooobasis${OO_VER}-xsltfilter-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org-ure-1.7.0-${OO_BUILD}.i586.rpm \
	openoffice.org3-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-base-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-calc-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-dict-en-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-dict-es-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-dict-fr-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-draw-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-en-US-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-impress-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-math-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	openoffice.org3-writer-${OO_RELEASE}-${OO_BUILD}.i586.rpm \
	desktop-integration/openoffice.org3.3-freedesktop-menus-3.3-9556.noarch.rpm

WRKSRC=	${WRKDIR}/OOO330_m20_native_packed-1_en-US.${OO_BUILD}

OPTIONS=	JAVA "Enable Java Support" off

.include <bsd.port.pre.mk>

LINPROCFS!=	/sbin/mount | ${GREP} linprocfs | ${AWK} '{print $1}'

.if defined(WITH_JAVA)
USE_JAVA=	yes
JAVA_VERSION=	1.4 1.5 1.6
.endif

pre-fetch:
.if !defined(PACKAGE_BUILDING)
.if ${LINPROCFS}
	@${ECHO}
	@${ECHO} Check if linprocfs is running: YES
.else
	@${ECHO} Check if linprocfs is running: NO
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} OpenOffice.org setup needs a running linprocfs. it seems
	@${ECHO} that procfs is not mounted on your system.  Please
	@${ECHO} read the linprocfs\(5\) manpage and ensure the
	@${ECHO} the following line is in /etc/fstab, and that the
	@${ECHO} linprocfs file system is mounted:
	@${ECHO}
	@${ECHO} linproc /compat/linux/proc linprocfs rw 0 0
	@${ECHO}
	@${FALSE}
.endif
.if !exists(${LINUXBASE}/etc/mtab)
	@${ECHO}
	@${ECHO} ERROR:
	@${ECHO}
	@${ECHO} The file ${LINUXBASE}/etc/mtab is missing.
	@${ECHO} OpenOffice.org needs this file else some functions
	@${ECHO} are not working. You can create it with
	@${ECHO}
	@${ECHO} touch ${LINUXBASE}/etc/mtab
	@${ECHO}
	@${FALSE}
.else
	@${ECHO} Check if ${LINUXBASE}/etc/mtab exists: YES
.endif
.endif

pre-install:
	${MKDIR} ${WRKDIR}/oo

do-install:
	@for fi in ${RPMFILES}; do \
	echo ${WRKSRC}/RPMS/$$fi; \
	if !(cd ${WRKDIR}/oo && ${RC_CMD} ${WRKSRC}/RPMS/$$fi ${RC_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done
	${RM} -rf ${WRKDIR}/oo/usr/bin/soffice ${WRKDIR}/oo/usr/share/applications
	${CHMOD} -R ug-s ${WRKDIR}/oo
	${CHOWN} -R 0:0 ${WRKDIR}/oo
	${MV} ${WRKDIR}/oo/opt/openoffice.org3 ${PREFIX}
	${MV} ${WRKDIR}/oo/opt/openoffice.org/basis3.3 ${PREFIX}/openoffice.org3/
	${MV} ${WRKDIR}/oo/opt/openoffice.org/ure ${PREFIX}/openoffice.org3/basis3.3/
	${MV} ${WRKDIR}/oo/usr/share/icons ${PREFIX}/share
	${MV} ${WRKDIR}/oo/usr/share/mime ${PREFIX}/share
	${MKDIR} ${PREFIX}/share/applications
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/base.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-base.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/calc.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-calc.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/draw.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-draw.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/extension.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-extension.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/impress.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-impress.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/math.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-math.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/printeradmin.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-printeradmin.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/share/xdg/writer.desktop ${PREFIX}/share/applications/openoffice.org${OO_VER}-writer.desktop
	${LN} -sf ${PREFIX}/openoffice.org3/program/soffice ${PREFIX}/bin/soffice
	${REINPLACE_CMD} "s,/etc,${TRUE_PREFIX}," \
		${WRKDIR}/oo/usr/bin/openoffice.org3
	${INSTALL} ${WRKDIR}/oo/usr/bin/openoffice.org3 ${PREFIX}/bin/
	${REINPLACE_CMD} -e 's|opt|usr/local|' ${PREFIX}/bin/openoffice.org3
.for i in scalc sdraw simpress swriter
	${LN} -sf ${PREFIX}/openoffice.org3/program/${i} ${PREFIX}/bin/${i}
.endfor

post-install:
	(cd ${PREFIX}/openoffice.org3; ${RM} basis-link; ${LN} -s basis3.3 basis-link )
	(cd ${PREFIX}/openoffice.org3/basis3.3; ${RM} ure-link;  ${LN} -s ure ure-link )

.include <bsd.port.post.mk>
